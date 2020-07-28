//
//  CustomClass.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/07/28.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit

class CustomClass: UIButton {
    @IBDesignable class CustomButton: UIButton {

        // 角丸の半径(0で四角形)
        @IBInspectable var cornerRadius: CGFloat = 0.0

        // 枠
        @IBInspectable var borderColor: UIColor = UIColor.clear
        @IBInspectable var borderWidth: CGFloat = 0.0

        override func draw(_ rect: CGRect) {
            // 角丸
            self.layer.cornerRadius = cornerRadius
            self.clipsToBounds = (cornerRadius > 0)

            // 枠線
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth

            super.draw(rect)
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
