//
//  ArtworkListViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/11/20.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit

class ArtworkListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var artworkImage: UIImageView!
    
    @IBAction func seeArtwork(_ sender: Any) {
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