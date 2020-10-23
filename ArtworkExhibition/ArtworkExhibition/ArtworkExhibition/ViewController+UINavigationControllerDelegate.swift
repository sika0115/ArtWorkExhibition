//
//  ViewController+UINavigationControllerDelegate.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/10/23.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase

extension ViewController: UINavigationControllerDelegate {
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerController.SourceType.photoLibrary

            present(controller, animated: true, completion: nil)
        }
    }
}
