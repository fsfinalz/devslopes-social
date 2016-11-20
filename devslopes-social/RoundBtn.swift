//
//  RoundBtn.swift
//  devslopes-social
//
//  Created by YoonJae Il on 2016. 11. 16..
//  Copyright © 2016년 YoonJae Il. All rights reserved.
//

import UIKit

class RoundBtn: UIButton {

    
    override func awakeFromNib() {
        //facebookbtn 커스텀
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor;
        layer.shadowOpacity = 0.8;
        layer.shadowRadius = 5.0;
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0);
        
        
        imageView?.contentMode = .scaleAspectFit
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        layer.cornerRadius = self.frame.width/2
    }
}
