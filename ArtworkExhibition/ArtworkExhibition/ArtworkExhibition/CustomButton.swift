//
//  CustomButton.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/07/28.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    @IBInspectable var textColor: UIColor?
     
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
     
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
     
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var highlightedBackgroundColor :UIColor?
    @IBInspectable var nonHighlightedBackgroundColor :UIColor?
    override var isHighlighted :Bool {
            didSet {
                if isHighlighted {
                    self.backgroundColor = highlightedBackgroundColor
                }
                else {
                    self.backgroundColor = nonHighlightedBackgroundColor
                }
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
