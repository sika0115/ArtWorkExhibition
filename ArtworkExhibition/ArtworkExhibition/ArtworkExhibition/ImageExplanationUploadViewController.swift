//
//  ImageExplanationUploadViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/13.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase

class ImageExplanationUploadViewController: UIViewController {

    @IBOutlet weak var AddImageExp: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func UploadImageExp(_ sender: Any) {
        //Cloud Firestoreに入力情報をアップロード、保存する
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
