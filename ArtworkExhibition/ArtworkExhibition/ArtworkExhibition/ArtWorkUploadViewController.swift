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
        
        let ud = UserDefaults.standard
                ud.set(0, forKey: "count")
        
        func countPhoto() -> String {
                let ud = UserDefaults.standard
                let count = ud.object(forKey: "count") as! Int
                ud.set(count + 1, forKey: "count")
                return String(count)
        }
        
        
        
        //ストレージ サービスへの参照を取得
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
          }
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
    

    
   
    }
}
