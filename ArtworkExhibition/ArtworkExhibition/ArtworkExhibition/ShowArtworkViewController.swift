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
    @IBOutlet weak var endExhibition: UIButton!
    
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
                    i = 0
                    print ("データ準備終了")
                    //UIImageViewにurlimageを指定して表示
                    //self.artworkImage.image = artworkImages[0]
                    
                    //ScrollViewの設定
                    let scrollView = UIScrollView()
                    scrollView.frame = CGRect(x: 0.0, y: 60.0, width: UIScreen.main.bounds.width, height:300 /*UIScreen.main.bounds.height*/)
                    //CGFloat → floatにキャストしないとだめ
                    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(artworkImages.count), height: 300/*UIScreen.main.bounds.height*/) //contentSizeをframeより大きく画像の枚数分だけ倍に設定
                    scrollView.isPagingEnabled = true //isPagingEnabledオプションをtrueに設定(慣性流れ防止)
                    
                    //var ImageView: [UIImageView] = []
                    while true{
                        // 画像1枚目
                        let ImageView1 = UIImageView(image: artworkImages[i])
                        ImageView1.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300/*UIScreen.main.bounds.height*/)
                        ImageView1.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView1)
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        
                        // 画像2枚目
                        let ImageView2 = UIImageView(image: artworkImages[i])
                        ImageView2.frame = CGRect(x: UIScreen.main.bounds.width * 1.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300)
                        ImageView2.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView2)
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        // 画像3枚目
                        let ImageView3 = UIImageView(image: artworkImages[i])
                        ImageView3.frame = CGRect(x: UIScreen.main.bounds.width * 2.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300)
                        ImageView3.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView3)
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        // 画像4枚目
                        let ImageView4 = UIImageView(image: artworkImages[i])
                        ImageView4.frame = CGRect(x: UIScreen.main.bounds.width * 3.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300)
                        ImageView4.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView4)
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        // 画像5枚目
                        let ImageView5 = UIImageView(image: artworkImages[i])
                        ImageView5.frame = CGRect(x: UIScreen.main.bounds.width * 4.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300)
                        ImageView5.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView5)
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        
                    }
                    // スクロールビューを追加
                    self.view.addSubview(scrollView)
                    
                }else{
                    print("Document does not exist")
                }
        }
        self.view.bringSubviewToFront(endExhibition)
    
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
