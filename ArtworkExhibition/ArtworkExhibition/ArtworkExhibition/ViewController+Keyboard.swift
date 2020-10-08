//
//  ViewController+KeyBoard.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/10/08.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}


