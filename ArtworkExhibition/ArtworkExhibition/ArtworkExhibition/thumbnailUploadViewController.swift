//
//  thumbnailUploadViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/20.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class thumbnailUploadViewController: UIViewController {
    var t_cnum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var thumbnail: UIImageView! {
        didSet {
            // デフォルトの画像を表示する
            thumbnail.image = UIImage(named: "no_image.png")
        }
    }
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func SelectThumbnail(_ sender: Any) {
        //サムネイル画像を選択
        //画像ライブラリの呼び出し、画像の選択
            imagePicker.allowsEditing = true //画像の切り抜き
            imagePicker.sourceType = .photoLibrary //画像ライブラリの呼び出し
            present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func ViewRelease(_ sender: Any) {
        //展示を公開する
        saveToFireStore() //通常+FireStoreにURL保存
    }
    
    //画像アップロード後にURLをFireStoreに保存
    fileprivate func upload(completed: @escaping(_ url: String?) -> Void) {
        let date = NSDate()
        let currentTimeStampInSecond = UInt64(floor(date.timeIntervalSince1970 * 1000))
        let storageRef = Storage.storage().reference().child("images").child("\(currentTimeStampInSecond).jpg")
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpg"
        
        if let uploadData = self.thumbnail.image?.jpegData(compressionQuality: 0.9) {
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
        let db = Firestore.firestore()
        db.collection("artworks")//コレクションにアクセス
        db.collection("artworks").document("artwork01")//データにアクセス
        upload(){ [self] url in
            guard let url = url else {return }
            let data:[String: Any] = ["thumbnail": url]
            db.collection("artworks").document("artwork01").setData(data, merge: true){ error in
                if error != nil {
                    print("error: \(error?.localizedDescription)")
                }
                print("image saved!")
            }
        }
    }
}

extension thumbnailUploadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            thumbnail.contentMode = .scaleAspectFit
            thumbnail.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
