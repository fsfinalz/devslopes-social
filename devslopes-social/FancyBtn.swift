//
//  FancyBtn.swift
//  devslopes-social
//
//  Created by YoonJae Il on 2016. 11. 16..
//  Copyright © 2016년 YoonJae Il. All rights reserved.
//

import UIKit

class FancyBtn: UIButton {
    //Sign in 버튼 커스텀
    override func awakeFromNib() {
        
        super.awakeFromNib();
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor;
        layer.shadowOpacity = 0.8;
        layer.shadowRadius = 5.0;
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0);
        layer.cornerRadius = 2.0;

    }
    

}
