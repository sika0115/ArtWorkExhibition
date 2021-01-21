//
//  SignUpViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/10/05.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    @IBOutlet private weak var emailTextField: UITextField! //メールアドレス
    @IBOutlet private weak var nameTextField: UITextField! //ユーザ名
    @IBOutlet private weak var passwordTextField: UITextField! //パスワード
    
    //登録ボタン押されたときの処理
    @IBAction private func didTapSignUpButton() {
        //テキストフィールドのテキストを取得して変数に入れる
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let name = nameTextField.text ?? ""
          
        //新しいユーザアカウント作成 - メアドとパスワードを渡すとUserクラスのユーザオブジェクトを返す
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
              if let user = result?.user {
                //createProfileChangeRequest()で変更用リクエストオブジェクトを生成
                  let req = user.createProfileChangeRequest()
                  req.displayName = name
                //名前を設定して commitChanges() を呼び出すことでFirebaseに再通信
                  req.commitChanges() { [weak self] error in
                      guard let self = self else { return }
                      if error == nil {
                        //確認メールをユーザに送る(sendEmailVerification())
                          user.sendEmailVerification() { [weak self] error in
                            guard self != nil else { return }
                              if error == nil {
                                // 仮登録完了画面へ遷移する処理
                                print(name)
                                print(email)
                                print("ユーザ登録完了")
                              }
                            self!.showErrorIfNeeded(error)
                          }
                      }
                      self.showErrorIfNeeded(error)
                  }
              }
              self.showErrorIfNeeded(error)
        }
    }
    
    //エラー表示用メソッド
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしない
        guard errorOrNil != nil else { return }
        
        let message = "エラーが起きました"
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
