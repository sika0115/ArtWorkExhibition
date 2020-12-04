//
//  SignInViewController.swift
//  ArtworkExhibition
//
//  Created by 庄司果鈴 on 2020/10/05.
//  Copyright © 2020 Karin Shoji. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
    }
    
    @IBOutlet private weak var emailTextField: UITextField! //メールアドレス用テキストフィールド
    @IBOutlet private weak var passwordTextField: UITextField! //パスワード用テキストフィールド
    
    // ログインボタン押下時の処理
    @IBAction private func didTapSignInButton() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        //サインインを行う
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
            if let user = result?.user{
                print("サインイン")
                //現在のユーザを取得 - currentUser
                let c_user = Auth.auth().currentUser
                if let current_user = c_user {
                    //let uid = user.uid
                    let email = current_user.email
                    let username = current_user.displayName
                    //print(uid)
                    print(email!)
                    print(username!)
                }
                print ("画面遷移へ")
                // サインイン後の画面へ (セグエ指定画面遷移)
                self.performSegue(withIdentifier: "goSignIn", sender: nil)
            } else {
                print("エラー処理へ")
                self.showErrorIfNeeded(error)
            }
        }
    }
    
    //エラー処理
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしない
        guard let error = errorOrNil else {
            print("エラー無し")
            return
            
        }
        
        let message = errorMessage(of: error) // エラーメッセージを取得
        print(message) //メッセージ取得ok
        //alert処理
        //UIAlertControllerのインスタンスを作る
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    private func errorMessage(of error: Error) -> String {
        var message = "エラーが発生しました"
        print("エラー発生")
        // 変数errorはSDKが返してきたエラー
        guard let errcd = AuthErrorCode(rawValue: (error as NSError).code) else {
            return message
        }
        
        switch errcd {
            case .networkError: message = "ネットワークに接続できません"
            case .userNotFound: message = "ユーザが見つかりません"
            case .invalidEmail: message = "不正なメールアドレスです"
            case .emailAlreadyInUse: message = "このメールアドレスは既に使われています"
            case .wrongPassword: message = "入力した認証情報でサインインできません"
            case .userDisabled: message = "このアカウントは無効です"
            default: break
        }
        return message
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
