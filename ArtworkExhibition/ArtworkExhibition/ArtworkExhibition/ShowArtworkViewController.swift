//
//  ShowArtworkViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/25.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ShowArtworkViewController: UIViewController {

    @IBOutlet weak var exibinameLabel: UILabel!
    @IBOutlet weak var artworknameLabel: UILabel!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var artwork_url = ""
        var arrayURLString: [String] = []
        let db = Firestore.firestore()
        let dbRef = db.collection("artworks").document("artwork01")
        dbRef.getDocument{ (document, error) in
                if let document = document {
                    //データベースのデータを全て取得
                    let data = document.data()
                    //サムネのurl用変数に画像のurlを代入(dataからサムネのurlだけ抜き出す)
                    arrayURLString = data!["image"] as! [String]
                    print(arrayURLString)
                    //print(arrayURLString[0])//要素0を取得
                    //取得したurlを変数に
                    let imageFileUrl:[String] = arrayURLString
                    print(imageFileUrl)
                    //UIImageViewに表示するデータを準備
                    //let urlimage:UIImage = UIImage(url: imageFileUrl)
                    //UIImageViewにurlimageを指定して表示
                    //self.thumbnail_image.image = urlimage
                }else{
                    print("Document does not exist")
                }
        }
        
        //let firstImageView = UIImageView(image: UIImage(named: "01.JPG"))
        // Do any additional setup after loading the view.
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
