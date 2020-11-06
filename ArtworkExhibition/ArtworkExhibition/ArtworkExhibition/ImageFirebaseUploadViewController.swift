//
//  ImageFirebaseUploadViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/06.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ImageFirebaseUploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ud = UserDefaults.standard
        ud.set(0, forKey: "count")
        // Do any additional setup after loading the view.
    }

    @IBAction func selectImageWithLibrary(_ sender: Any) {
        pickImageFromLibrary()
    }
    
    func countPhoto() -> String {
        let ud = UserDefaults.standard
        let count = ud.object(forKey: "count") as! Int
        ud.set(count + 1, forKey: "count")
        return String(count)
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

// MARK: UINavigationControllerDelegate
extension ImageFirebaseUploadViewController: UINavigationControllerDelegate {
    func pickImageFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = UIImagePickerController.SourceType.photoLibrary

            present(controller, animated: true, completion: nil)
        }
    }
}

// MARK: UIImagePickerControllerDelegate
extension ImageFirebaseUploadViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
        info: [String : Any]) {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "gs://artworkexhibition-a476c.appspot.com")

        if let data = (info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage).pngData() {
            let reference = storageRef.child("image/" + NSUUID().uuidString + "/" + countPhoto() + ".jpg")
            reference.putData(data, metadata: nil, completion: { metaData, error in
                print(metaData)
                print(error)
            })
            dismiss(animated: true, completion: nil)
        }
    }
}
