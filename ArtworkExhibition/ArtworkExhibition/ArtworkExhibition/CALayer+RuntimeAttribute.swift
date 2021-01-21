//
//  CALayer+RuntimeAttribute.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/07/28.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit

extension CALayer {

    func setBorderIBColor(color: UIColor!) -> Void{
        self.borderColor = color.cgColor
    }
}
