//
//  MyPageViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/12/04.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase

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
        UsernameLabel.text = Username
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
