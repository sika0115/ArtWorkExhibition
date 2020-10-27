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

class ArtWorkUploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //参照の作成
        //rootへの参照
        let storageRef = Storage.storage().reference()
        //imagesへの子参照
        let imagesRef = storageRef.child("images")
        
        //images/image.jpg
        //変数を使用して子の値を作成できることに注意
        let fileName = "image.jpg"
        let imageRef = imagesRef.child(fileName)
        
        //ファイルパス images/space.jpg
        let path = imageRef.fullPath;
        
        //ファイル名 image.jpg
        let name = imageRef.name;
        
        //imagesへ移動
        let imeges = imageRef.parent()
        
            /* let ud = UserDefaults.standard
                ud.set(0, forKey: "count")
            */
        
    }
    
   /* @IBAction func selectImage(_ sender: Any) {
        /*if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerController.SourceType.photoLibrary

            present(controller, animated: true, completion: nil)
        }*/
        pickImageFromLibrary()
        
    }
    
    func countPhoto() -> String {
            let ud = UserDefaults.standard
            let count = ud.object(forKey: "count") as! Int
            ud.set(count + 1, forKey: "count")
            return String(count)
    }
    
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
                let controller = UIImagePickerController()
                controller.delegate = self
                controller.sourceType = UIImagePickerController.SourceType.photoLibrary

                present(controller, animated: true, completion: nil)
            }
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
            info: [String : Any]) {
        let storage = Storage.storage()
                    let storageRef = storage.reference(forURL: "gs://artworkexhibition-a476c.appspot.com")

                if let data = (info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage).pngData() {
                        let reference = storageRef.child("image/" + NSUUID().uuidString + "/" + countPhoto() + ".jpg")
                        reference.putData(data, metadata: nil, completion: { metaData, error in
                            print(metaData as Any)
                    print(error as Any)
                })
                dismiss(animated: true, completion: nil)
            }
        }
    
     */
        
}

