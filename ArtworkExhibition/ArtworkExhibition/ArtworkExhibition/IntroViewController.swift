//
//  IntroViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/06/29.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBAction func UserRegistrationButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "アプリの使用に関する注意点", message: "他人の作品を無断でアップロードすることは禁止です。アプリ利用においてアップロードした画像は保存・取得以外の用途では用いません。", preferredStyle: UIAlertController.Style.alert)
        let action1 = UIAlertAction(title: "同意", style: UIAlertAction.Style.default, handler: {(action: UIAlertAction!)in
            print ("同意しました。")
            //登録画面へ
            self.performSegue(withIdentifier: "goSignUp", sender: nil)
        })
        let cancel = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {(action: UIAlertAction!)in
            print("キャンセル")
        })
        
        alert.addAction(action1)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
