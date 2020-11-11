//
//  ImageUploadViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/10/30.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ImageUploadViewController: UIViewController {
    
    @IBOutlet weak var UploadImageView: UIImageView!{
        didSet {
            // デフォルトの画像を表示する
            UploadImageView.image = UIImage(named: "no_image.png")
        }
    }
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SelectImageButton(_ sender: Any) {
    //画像ライブラリの呼び出し、画像の選択
        imagePicker.allowsEditing = true //画像の切り抜き
        imagePicker.sourceType = .photoLibrary //画像ライブラリの呼び出し
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func UploadFirebaseButton(_ sender: Any) {
    //Firebaseへのアップロード
        //upload() //通常
        saveToFireStore() //通常+FireStoreにURL保存
    }
    
    //通常画像アップロード
    /*
    fileprivate func upload() {
        let date = NSDate()
        let currentTimeStampInSecond = UInt64(floor(date.timeIntervalSince1970 * 1000))
        //参照の作成
        let storageRef = Storage.storage().reference().child("images").child("\(currentTimeStampInSecond).jpg")
        //ファイルメタデータの追加
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        if let uploadData = self.UploadImageView.image?.jpegData(compressionQuality: 0.5) {
            storageRef.putData(uploadData, metadata: metaData) { (metadata , error) in
                if error != nil {
                    print("error: \(error?.localizedDescription)")
                }
                
                storageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        print("error: \(error?.localizedDescription)")
                    }
                    print("url: \(url?.absoluteString)")
                })
            }
        }
    }
 */
    
    //画像アップロード後にURLをFireStoreに保存
    fileprivate func upload(completed: @escaping(_ url: String?) -> Void) {
        let date = NSDate()
        let currentTimeStampInSecond = UInt64(floor(date.timeIntervalSince1970 * 1000))
        let storageRef = Storage.storage().reference().child("images").child("\(currentTimeStampInSecond).jpg")
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        if let uploadData = self.UploadImageView.image?.jpegData(compressionQuality: 0.9) {
            storageRef.putData(uploadData, metadata: metaData) { (metadata , error) in
                if error != nil {
                    completed(nil)
                    print("error: \(error?.localizedDescription)")
                }
                storageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        completed(nil)
                        print("error: \(error?.localizedDescription)")
                    }
                    completed(url?.absoluteString)
                })
            }
        }
    }
    
    fileprivate func saveToFireStore(){
        var data: [String : Any] = [:]
        upload(){ url in
            guard let url = url else {return }
            data["image"] = url
            Firestore.firestore().collection("images").document().setData(data){ error in
                if error != nil {
                    print("error: \(error?.localizedDescription)")
                }
                print("image saved!")
            }
        }
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

extension ImageUploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            UploadImageView.contentMode = .scaleAspectFit
            UploadImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
