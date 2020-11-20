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
    
    @IBAction func UploadExibiName(_ sender: Any) {
        // TextField(AddImageExp)から文字を取得
        exhibiNameString = ExibiNameField.text!
        // TextField(AddImageExp)の中身をクリア
        ExibiNameField.text = ""
        
        //Cloud Firestoreに入力情報をアップロード、保存する
        let db = Firestore.firestore()
        db.collection("artworks")//コレクションにアクセス
        db.collection("artworks").document("artwork01")//データにアクセス
        let data: [String: Any] = ["exibiname":exhibiNameString] //更新用データ
        db.collection("artworks").document("artwork01").setData(data, merge: true)
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
