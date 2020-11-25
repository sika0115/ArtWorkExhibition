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
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var artworkImage: UIImageView!
    
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
                    
                    //取得したurlを変数に
                    let imageFileUrl:[String] = arrayURLString
                    
                    //UIImageViewに表示するデータを準備
                    print("データ準備開始")
                    var i:Int = 0
                    var artworkImages: [UIImage] = [] //UIImage配列を作成
                    //var artworkImages = Array<UIImage>(repeating: UIImage, count:5)
                    //var values = Array<Int>(count:10, repeatedValue:0)
                    while i < Int(imageFileUrl.count) {
                        //imageFileUrlの要素数を取得して要素数以上になったら終了
                        
                        //let urlimage:UIImage = UIImage(url: imageFileUrl[i])
                        artworkImages += [UIImage(url: imageFileUrl[i])]
                        print(i)
                        i = i + 1
                    }
                    print ("データ準備終了")
                    //UIImageViewにurlimageを指定して表示
                    self.artworkImage.image = artworkImages[0]
                }else{
                    print("Document does not exist")
                }
        }
    
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
