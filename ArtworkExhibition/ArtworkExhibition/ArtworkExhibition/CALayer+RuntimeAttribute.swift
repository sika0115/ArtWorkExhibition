//
//  CALayer+RuntimeAttribute.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/07/28.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
/*
class CALayer_RuntimeAttribute: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
*/
extension CALayer {

    func setBorderIBColor(color: UIColor!) -> Void{
        self.borderColor = color.cgColor
    }
}
