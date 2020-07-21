//
//  ViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/06/29.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

       override func viewDidLoad() {
            super.viewDidLoad()
            //Do any additional setup after loading the view, typically from a nib.
            
            //2秒後に画面遷移
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                //SegueのGoIntroを指定して遷移させるコード
                self.performSegue(withIdentifier: "GoIntro", sender: nil)
            }
       }
    
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
        }
}
