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

class ArtWorkUploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // [1]ストレージ サービスへの参照を取得
        let storage = Storage.storage()

        // [2]ストレージへの参照を取得
        let storageRef = storage.reference(forURL: "gs://artworkexhibition-a476c.appspot.com")

        // [3]ツリーの下位への参照を作成
        let imageRef = storageRef.child("images/image.jpg")

        // [4]Dataを作成
        let imageData = UIImage(named: "image")!.jpegData(compressionQuality: 1.0)!

        // [5]アップロードを実行
        imageRef.putData(imageData, metadata: nil) { metadata, error in
            if (error != nil) {
                print("an error occurred!")
            } else {
                // Metadata contains file metadata such as size, content-type.
                let size = metadata?.size
                  // You can also access to download URL after upload.
                  imageRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                      // Uh-oh, an error occurred!
                      return
              //  let downloadURL = metadata!.downloadURL()!
              //  print("downloadURL:", downloadURL)
                    }
       
                  }
            }
            
            
        }
    }
}
