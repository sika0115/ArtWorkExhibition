//
//  ViewController+pickPhoto.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/10/27.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit

// MARK: UINavigationControllerDelegate
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
