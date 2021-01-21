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
    var artworkname_deli: String?
    var artworkdesc_deli: String?
    var artworkname: [String] = [] //作品名用格納配列
    var artworkdesc: [String] = [] //作品説明用格納配列
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ボタンのインスタンス作成
        let button1 = UIButton()
        let button2 = UIButton()
        let button3 = UIButton()
        let button4 = UIButton()
        let button5 = UIButton()
        
        //var artwork_url = ""
        var arrayURLString: [String] = [] //作品URL用格納配列
        let db = Firestore.firestore()
        let dbRef = db.collection("artworks").document("artwork01")
        dbRef.getDocument{ (document, error) in
                if let document = document {
                    //データベースのデータを全て取得
                    let data = document.data()
                    //サムネのurl用変数に画像のurlを代入(dataからサムネのurlだけ抜き出す)
                    arrayURLString = data!["image"] as! [String]
                    //作品名と作品説明の取得、格納
                    self.artworkname = data!["artwork01name"] as! [String]
                    self.artworkdesc = data!["artwork01desc"] as! [String]
                    //取得したurlを変数に
                    let imageFileUrl:[String] = arrayURLString
                    //let artworknameArray:[String] = artworkname
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
                    scrollView.frame = CGRect(x: 0.0, y: 60.0, width: UIScreen.main.bounds.width, height:300)
                    //CGFloat → floatにキャストする必要あり
                    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(artworkImages.count), height: 300/*UIScreen.main.bounds.height*/) //contentSizeをframeより大きく画像の枚数分だけ倍に設定
                    scrollView.isPagingEnabled = true //isPagingEnabledオプションをtrueに設定(慣性流れ防止)
                    
                    //var ImageView: [UIImageView] = []
                    while true{
                        // 画像1枚目
                        let ImageView1 = UIImageView(image: artworkImages[i])
                        ImageView1.frame = CGRect(x: UIScreen.main.bounds.width * 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300/*UIScreen.main.bounds.height*/)
                        ImageView1.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView1)
                        
                        let screenWidth:CGFloat = self.view.frame.width
                        //作品説明と作品名表示用ボタンの作成
                        
                        button1.setTitle("作品詳細1", for:UIControl.State.normal)
                        button1.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
                        button1.setTitleColor(UIColor.black, for: .normal)
                        button1.frame = CGRect(x:screenWidth/4, y:350,width: screenWidth/2, height: 50)
                        // Viewにボタンを追加
                        self.view.addSubview(button1)
                        
                        //作品がもうない場合の判定
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        
                        // 画像2枚目
                        let ImageView2 = UIImageView(image: artworkImages[i])
                        ImageView2.frame = CGRect(x: UIScreen.main.bounds.width * 1.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300)
                        ImageView2.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView2)
                        
                        //作品説明と作品名表示用ボタンの作成
                        button2.setTitle("作品詳細2", for:UIControl.State.normal)
                        button2.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
                        button2.setTitleColor(UIColor.black, for: .normal)
                        button2.frame = CGRect(x:screenWidth/4, y:380,width: screenWidth/2, height: 50)
                        // Viewにボタンを追加
                        self.view.addSubview(button2)
                        
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        // 画像3枚目
                        let ImageView3 = UIImageView(image: artworkImages[i])
                        ImageView3.frame = CGRect(x: UIScreen.main.bounds.width * 2.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300)
                        ImageView3.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView3)
                        
                        //作品説明と作品名表示用ボタンの作成
                        button3.setTitle("作品詳細3", for:UIControl.State.normal)
                        button3.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
                        button3.setTitleColor(UIColor.black, for: .normal)
                        button3.frame = CGRect(x:screenWidth/4, y:410,width: screenWidth/2, height: 50)
                        // Viewにボタンを追加
                        self.view.addSubview(button3)
                        
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        // 画像4枚目
                        let ImageView4 = UIImageView(image: artworkImages[i])
                        ImageView4.frame = CGRect(x: UIScreen.main.bounds.width * 3.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300)
                        ImageView4.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView4)
                        
                        //作品説明と作品名表示用ボタンの作成
                        button4.setTitle("作品詳細4", for:UIControl.State.normal)
                        button4.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
                        button4.setTitleColor(UIColor.black, for: .normal)
                        button4.frame = CGRect(x:screenWidth/4, y:440,width: screenWidth/2, height: 50)
                        // Viewにボタンを追加
                        self.view.addSubview(button4)
                        
                        i = i + 1
                        if i >= Int(artworkImages.count){
                            break
                        }
                        // 画像5枚目
                        let ImageView5 = UIImageView(image: artworkImages[i])
                        ImageView5.frame = CGRect(x: UIScreen.main.bounds.width * 4.0, y: 0.0, width: UIScreen.main.bounds.width, height: 300)
                        ImageView5.contentMode = UIView.ContentMode.scaleAspectFit
                        scrollView.addSubview(ImageView5)
                        
                        //作品説明と作品名表示用ボタンの作成
                        button5.setTitle("作品詳細5", for:UIControl.State.normal)
                        button5.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
                        button5.setTitleColor(UIColor.black, for: .normal)
                        button5.frame = CGRect(x:screenWidth/4, y:470,width: screenWidth/2, height: 50)
                        // Viewにボタンを追加
                        self.view.addSubview(button5)
                        
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
        //button1押下時に関数button1Tappedを呼び出す
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        
        button4.addTarget(self, action: #selector(button4Tapped), for: .touchUpInside)
        
        button5.addTarget(self, action: #selector(button5Tapped), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func button1Tapped(_ sender: UIButton) {
        print(artworkname[0]) //作品名取得ok
        print(artworkdesc[0]) //作品説明取得ok
        artworkname_deli = artworkname[0]
        artworkdesc_deli = artworkdesc[0]
        //selectorで呼び出す場合Swift4からは「@objc」をつける
        self.performSegue(withIdentifier: "toArtworkDataView", sender: nil)
        print("buttonTapped called") //呼び出し成功
    }
    
    @objc func button2Tapped(_ sender: UIButton) {
        print(artworkname[1]) //作品名取得ok
        print(artworkdesc[1]) //作品説明取得ok
        artworkname_deli = artworkname[1]
        artworkdesc_deli = artworkdesc[1]
        //selectorで呼び出す場合Swift4からは「@objc」をつける
        self.performSegue(withIdentifier: "toArtworkDataView", sender: nil)
        print("buttonTapped called") //呼び出し成功
    }
    
    @objc func button3Tapped(_ sender: UIButton) {
        print(artworkname[2]) //作品名取得ok
        print(artworkdesc[2]) //作品説明取得ok
        artworkname_deli = artworkname[2]
        artworkdesc_deli = artworkdesc[2]
        //selectorで呼び出す場合Swift4からは「@objc」をつける
        self.performSegue(withIdentifier: "toArtworkDataView", sender: nil)
        print("buttonTapped called") //呼び出し成功
    }
    
    @objc func button4Tapped(_ sender: UIButton) {
        print(artworkname[3]) //作品名取得ok
        print(artworkdesc[3]) //作品説明取得ok
        artworkname_deli = artworkname[3]
        artworkdesc_deli = artworkdesc[3]
        //selectorで呼び出す場合Swift4からは「@objc」をつける
        self.performSegue(withIdentifier: "toArtworkDataView", sender: nil)
        print("buttonTapped called") //呼び出し成功
    }
    
    @objc func button5Tapped(_ sender: UIButton) {
        print(artworkname[4]) //作品名取得ok
        print(artworkdesc[4]) //作品説明取得ok
        artworkname_deli = artworkname[4]
        artworkdesc_deli = artworkdesc[4]
        //selectorで呼び出す場合Swift4からは「@objc」をつける
        self.performSegue(withIdentifier: "toArtworkDataView", sender: nil)
        print("buttonTapped called") //呼び出し成功
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //segueが呼び出されたらこの処理に来る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            print("セグエ実行前処理")
            // Segueの識別子確認
            if segue.identifier == "toArtworkDataView" {
     
            // 遷移先ViewCntrollerの取得
            let nextView = segue.destination as! ArtworkDataViewController
     
            // 値の設定
            nextView.text1 = artworkname_deli
            nextView.text2 = artworkdesc_deli
            print("ok")
        }
    }
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
