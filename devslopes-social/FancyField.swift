//
//  FancyField.swift
//  devslopes-social
//
//  Created by YoonJae Il on 2016. 11. 16..
//  Copyright © 2016년 YoonJae Il. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    override func awakeFromNib() {
        
        super.awakeFromNib();
    
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.2).cgColor;
        layer.borderWidth = 1.0;
        layer.cornerRadius = 2.0;
    
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
}
