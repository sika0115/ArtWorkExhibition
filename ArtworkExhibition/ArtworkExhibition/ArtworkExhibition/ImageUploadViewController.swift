//
//  ImageUploadViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/10/30.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase

class ImageUploadViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var UploadImageView: UIImageView!
    
    // 画像が選択された時に呼ばれる
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])  {
           if let selectedImage = info[.originalImage] as? UIImage {
               UploadImageView.image = selectedImage  //imageViewにカメラロールから選んだ画像を表示する
           }
           self.dismiss(animated: true)  //画像をImageViewに表示したらアルバムを閉じる
       }
       
       // 画像選択がキャンセルされた時に呼ばれる
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           self.dismiss(animated: true, completion: nil)
       }
    
    
   @IBAction func UploadImageButton(_ sender: Any) {
        let picker = UIImagePickerController() //アルバムを開く処理を呼び出す
            picker.sourceType = .photoLibrary
            picker.delegate = self
            present(picker, animated: true)
            self.present(picker, animated: true, completion: nil)
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



