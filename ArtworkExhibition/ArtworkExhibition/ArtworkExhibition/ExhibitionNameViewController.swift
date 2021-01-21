//
//  ExhibitionNameViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/20.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

//展示名をDBにアップロード
class ExhibitionNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var ExibiNameField: UITextField!
    
    //文字列保存用の変数
    var exhibiNameString = ""
    var usernameString = ""
    
    @IBAction func UploadExibiName(_ sender: Any) {
        // TextField(AddImageExp)から文字を取得
        exhibiNameString = ExibiNameField.text!
        // TextField(AddImageExp)の中身をクリア
        ExibiNameField.text = ""
        
        //現在のユーザを取得 - currentUser
        let c_user = Auth.auth().currentUser
        if let current_user = c_user {
            let username = current_user.displayName
            usernameString = username!
            print(username!)
        }
        //Cloud Firestoreに入力情報をアップロード、保存する
        let db = Firestore.firestore()
        db.collection("artworks")//コレクションにアクセス
        db.collection("artworks").document("artwork01")//データにアクセス
        let exibiname_data: [String: Any] = ["exibiname":exhibiNameString] //更新用データ
        let username_data: [String: Any] = ["e_username":usernameString] 
        db.collection("artworks").document("artwork01").setData(exibiname_data, merge: true)
        db.collection("artworks").document("artwork01").setData(username_data, merge: true)
    }
}
