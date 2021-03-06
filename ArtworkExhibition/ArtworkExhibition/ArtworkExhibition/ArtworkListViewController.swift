//
//  ArtworkListViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/20.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ArtworkListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func getImageByUrl(url: String) -> UIImage{
            let url = URL(string: url)
            do {
                let data = try Data(contentsOf: url!)
                return UIImage(data: data)!
            } catch let err {
                print("Error : \(err.localizedDescription)")
            }
            return UIImage()
        }
        
        var thum_url = ""
        var exibinameString = ""
        let db = Firestore.firestore()
        let dbRef = db.collection("artworks").document("artwork01")
        dbRef.getDocument{ (document, error) in
                if let document = document {
                    //データベースのデータを全て取得
                    let data = document.data()
                    //サムネのurl用変数に画像のurlを代入(dataからサムネのurlだけ抜き出す)
                    thum_url = data!["thumbnail"] as! String
                    exibinameString = data!["exibiname"] as! String
                    self.exibinameLabel.text = exibinameString
                    //取得したurlを変数に
                    let imageFileUrl = thum_url
                    //UIImageViewに表示するデータを準備
                    let urlimage:UIImage = getImageByUrl(url: imageFileUrl)
                    //UIImageViewにurlimageを指定して表示
                    self.thumbnail_image.image = urlimage
                }else{
                    print("Document does not exist")
                }
        }
    }
    @IBOutlet weak var exibinameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var thumbnail_image: UIImageView!
    
    @IBAction func seeArtwork(_ sender: Any) {
        
    }
}
