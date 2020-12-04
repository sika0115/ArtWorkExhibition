//
//  MyPageViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/12/04.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class MyPageViewController: UIViewController {

    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    
    var Username = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //現在のユーザを取得 - currentUser
        let c_user = Auth.auth().currentUser
        if let current_user = c_user {
            let username = current_user.displayName
            Username = username!
            print(username!)
        }
        UsernameLabel.text = Username //現在のユーザ表示
        
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
        var e_user = ""
        
        let db = Firestore.firestore()
        let dbRef = db.collection("artworks").document("artwork01")
        dbRef.getDocument{ (document, error) in
                if let document = document {
                    //データベースのデータを全て取得
                    let data = document.data()
                    //サムネのurl用変数に画像のurlを代入(dataからサムネのurlだけ抜き出す)
                    thum_url = data!["thumbnail"] as! String
                    e_user = data!["e_username"] as! String
                    
                    if e_user == self.Username {
                        //取得したurlを変数に
                        let imageFileUrl = thum_url
                        //UIImageViewに表示するデータを準備
                        let urlimage:UIImage = getImageByUrl(url: imageFileUrl)
                        //UIImageViewにurlimageを指定して表示
                        self.ImageView.image = urlimage
                    } else {
                        print("展示はありません")
                    }
                }else{
                    print("Document does not exist")
                }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
