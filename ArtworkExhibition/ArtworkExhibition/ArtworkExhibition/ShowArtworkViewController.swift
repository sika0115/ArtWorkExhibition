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
                    //self.artworkImage.image = artworkImages[0]
                    
                    let scrollView = UIScrollView()
                    scrollView.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height)
                    scrollView.isPagingEnabled = true
                    
                    // 1枚目の画像
                    let firstImageView = UIImageView(image: artworkImages[0])
                    firstImageView.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    firstImageView.contentMode = UIView.ContentMode.scaleAspectFit
                    scrollView.addSubview(firstImageView)
                    
                    // 2枚目の画像
                    let secondImageView = UIImageView(image: artworkImages[1])
                    secondImageView.frame = CGRect(x: UIScreen.main.bounds.width * 1.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    secondImageView.contentMode = UIView.ContentMode.scaleAspectFit
                    scrollView.addSubview(secondImageView)

                    // 3枚目の画像
                    let thirdImageView = UIImageView(image: artworkImages[2])
                    thirdImageView.frame = CGRect(x: UIScreen.main.bounds.width * 2.0, y: 0.0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    thirdImageView.contentMode = UIView.ContentMode.scaleAspectFit
                    scrollView.addSubview(thirdImageView)

                    // スクロールビューを追加
                    self.view.addSubview(scrollView)
                    
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
