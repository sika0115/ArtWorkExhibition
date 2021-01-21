//
//  ImageDescriptionViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/16.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class ImageDescriptionViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var writeDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 文字列保存用の変数
    var textFieldString = ""
    
    @IBAction func addImageDescription(_ sender: Any) {
        // TextField(writeDescription)から文字を取得
        textFieldString = writeDescription.text!
        // TextField(writeDescription)の中身をクリア
        writeDescription.text = ""
        
        //Cloud Firestoreに入力情報をアップロード、保存する
        let db = Firestore.firestore()
        db.collection("artworks")//コレクションにアクセス
        db.collection("artworks").document("artwork01")//データにアクセス
        let data: [String: Any] = ["artwork01desc":FieldValue.arrayUnion([textFieldString])] //更新用データ
        db.collection("artworks").document("artwork01").setData(data, merge: true)
    }
}
