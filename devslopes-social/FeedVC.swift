//
//  FeedVC.swift
//  devslopes-social
//
//  Created by YoonJae Il on 2016. 11. 20..
//  Copyright © 2016년 YoonJae Il. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signInTapped(_ sender: Any) {
        let keychainReuslt = KeychainWrapper.standard.remove(key: KEY_UID)
        print("JESS: \(keychainReuslt)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
   
}
