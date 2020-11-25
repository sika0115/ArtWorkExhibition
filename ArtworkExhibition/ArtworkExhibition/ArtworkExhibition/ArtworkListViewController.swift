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
        
        var thum_url = ""
        let db = Firestore.firestore()
        let dbRef = db.collection("artworks").document("artwork01")
        dbRef.getDocument{ (document, error) in
                if let document = document {
                    //データベースのデータを全て取得
                    let data = document.data()
                    //サムネのurl用変数に画像のurlを代入(dataからサムネのurlだけ抜き出す)
                    thum_url = data!["thumbnail"] as! String
                    //取得したurlを変数に
                    let imageFileUrl = thum_url
                    //UIImageViewに表示するデータを準備
                    let urlimage:UIImage = UIImage(url: imageFileUrl)
                    //UIImageViewにurlimageを指定して表示
                    self.thumbnail_image.image = urlimage
                }else{
                    print("Document does not exist")
                }
        }
    }
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var thumbnail_image: UIImageView!
    
    @IBAction func seeArtwork(_ sender: Any) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension UIImage {
    public convenience init(url: String) {
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            self.init(data: data)!
            return
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        self.init()
    }
}
