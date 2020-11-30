//
//  ArtworkDataViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/30.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class ArtworkDataViewController: UIViewController {

    @IBOutlet weak var artworknameLabel: UILabel!
    @IBOutlet weak var artworkdescLabel: UILabel!
    
    var text1: String?
    var text2: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artworknameLabel.text = text1
        artworkdescLabel.text = text2
        // Do any additional setup after loading the view.
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
