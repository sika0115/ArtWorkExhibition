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
        
        let ud = UserDefaults.standard
                ud.set(0, forKey: "count")
        
        
    }
    
    @IBAction func selectImage(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerController.SourceType.photoLibrary

            present(controller, animated: true, completion: nil)
        }
    }
    
        
      /*//ストレージ サービスへの参照を取得
        let storage = Storage.storage()
        //ストレージサービスからストレージ参照を作成
        let storageRef = storage.reference(forURL: "gs://artworkexhibition-a476c.appspot.com")
        // ディスク上にあるファイル
        let localFile = URL(string: "path/to/image")!
        // 子参照を作成
        // imagesRefが「images」を指すようになった(アップロードするファイルへの参照を作成)
        let imagesRef = storageRef.child("image/" + NSUUID().uuidString + "/" + countPhoto() + ".jpg")
        
        //ファイルをパスにアップロード
        let uploadTask = imagesRef.putFile(from: localFile, metadata: nil) { metadata, error in
          guard let metadata = metadata else {
            // エラー発生
            return
          }*/
        /*//メタデータには、サイズ、コンテンツタイプなどのファイルメタデータが含まれる
        let size = metadata.size
        */
        /*//アップロード後にダウンロードURLにアクセスする
        imagesRef.downloadURL { (url, error) in
            guard let downloadURL = url else {
                  // エラーが発生
                  return
            }
        }*/
        
        
}

// MARK: UIImagePickerControllerDelegate
extension ViewController: UIImagePickerControllerDelegate {
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
        info: [String : Any]) {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "gs://artworkexhibition-a476c.appspot.com")

        func countPhoto() -> String {
                let ud = UserDefaults.standard
                let count = ud.object(forKey: "count") as! Int
                ud.set(count + 1, forKey: "count")
                return String(count)
        }
        
        if let data = (info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage).pngData() {
            let imagesRef = storageRef.child("image/" + NSUUID().uuidString + "/" + countPhoto() + ".jpg")
            imagesRef.putData(data, metadata: nil, completion: { metaData, error in
                print(metaData)
                print(error)
            })
            dismiss(animated: true, completion: nil)
        }
    }
}
