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

        // Do any additional setup after loading the view.
    }
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    @IBAction private func didTapSignUpButton() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let name = nameTextField.text ?? ""
          
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let self = self else { return }
              if let user = result?.user {
                  let req = user.createProfileChangeRequest()
                  req.displayName = name
                  req.commitChanges() { [weak self] error in
                      guard let self = self else { return }
                      if error == nil {
                          user.sendEmailVerification() { [weak self] error in
                            guard self != nil else { return }
                              if error == nil {
                                  // 仮登録完了画面へ遷移する処理
                                self?.performSegue(withIdentifier: "GoOK", sender: nil)
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
  
    private func showErrorIfNeeded(_ errorOrNil: Error?) {
        // エラーがなければ何もしません
        guard errorOrNil != nil else { return }
        
        let message = "エラーが起きました" // ここは後述しますが、とりあえず固定文字列
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
