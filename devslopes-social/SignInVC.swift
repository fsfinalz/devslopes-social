//
//  ViewController.swift
//  devslopes-social
//
//  Created by YoonJae Il on 2016. 11. 13..
//  Copyright © 2016년 YoonJae Il. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper


class SignInVC: UIViewController {
    
    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var pwdField: FancyField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self){(result, error) in
            if error != nil{
                print("JESS : Unable to authenticate with FACEBOOK");

            }else if result?.isCancelled == true{
                print("JESS: User cancelled Facebook authentication")
            }else {
                print("JESS : Succesfully authenticated with Facebook")
                let credntial = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credntial);
            }
            
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential){
        FIRAuth.auth()?.signIn(with: credential, completion: {(user, error)in
            if error != nil {
                print("JESS: Unable to authenticate with Firebase - \(error)")
            }else {
                print("JESS: Succesfully authenticated with Firebase")
                if let user = user{
                    self.completeSignIn(id: user.uid)
                }
                
            }
            
        })
    }

    @IBAction func signInTapped(_ sender: AnyObject) {
        if let email = emailField.text, let pwd = pwdField.text{
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: {(user, error) in
                if error == nil{
                    print("JESS: Email user authenticated with Firebase")
                    
                    if let user = user{
                        self.completeSignIn(id: user.uid);
                    }
                }else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil{
                            print("JESS: Unable to authenticatte with Firebase using email")
                        }else {
                            print("JESS : Succesfully authenticated with Firebase")
                            if let user = user{
                                self.completeSignIn(id: user.uid);

                            }
                        }
                        
                    });
                }
                
            });
        }
        
    }
    
    func completeSignIn(id: String){
        let keychainResult = KeychainWrapper.defaultKeychainWrapper.set(id, forKey: KEY_UID)
        print("JESS: Data save to kechain \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
}

