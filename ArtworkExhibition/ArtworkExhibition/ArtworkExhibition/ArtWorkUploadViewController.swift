//
//  ArtWorkUploadViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/10/23.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

let storage = Storage.storage()
let storageRef = storage.reference()

class ArtWorkUploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectImage(_ sender: Any) {
        //pickImageFromLibrary()
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerController.SourceType.photoLibrary

            present(controller, animated: true, completion: nil)
        }
        
        let localFile = URL(string: "path/to/image")!
        let imageRef = storageRef.child("images/0.jpg")
        
        let uploadTask = imageRef.putFile(from:localFile, metadata:nil) {metadata,error in
            guard let metadata = metadata else {
                //エラー
                return
            }
            let size = metadata.size
            
            imageRef.downloadURL{(url, error) in
                guard let downloadURL = url else {
                    //エラー
                    return
                }
            }
        }
    }
}

