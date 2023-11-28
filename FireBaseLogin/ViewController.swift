//
//  ViewController.swift
//  FireBaseLogin
//
//  Created by Apple8 on 23/11/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseAppCheckInterop

class ViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.loginBtn.addTarget(self, action: #selector(LoginBtntapped(sender: )), for: .touchUpInside)
    }
    
    @objc func LoginBtntapped(sender: UIButton){
        if self.userNameTextField.text == "" && self.userNameTextField.text?.count == 0{
            self.ShowDismiss(alertStr: "Message", msgStr: "Please Enter Valid Email")
        }
        if self.passwordTextfield.text == "" && self.passwordTextfield.text?.count == 0{
            self.ShowDismiss(alertStr: "Message", msgStr: "Please Enter Valid Password")
        }
        self.Login()
    }
    
    func Login(){
        Auth.auth().signIn(withEmail: self.userNameTextField.text!, password: self.passwordTextfield.text!) { authResult, error in
            print(authResult as Any)
            print(error as Any)
            if authResult?.user.email == self.userNameTextField.text{
                self.ShowSuccess(alertStr: "Message", msgStr: "Login Success")
                isEmailVerified = ((authResult?.user.isEmailVerified) != nil)
                email = (authResult?.user.email)!
                refreshToken = (authResult?.user.refreshToken)!
            }else{
                self.ShowDismiss(alertStr: "Message", msgStr: "No user found!")
            }
        }
        
     
    }
    func ShowDismiss(alertStr: String, msgStr: String){
        let alert = UIAlertController(title: alertStr, message: msgStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.destructive, handler: {action in
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }

    func ShowSuccess(alertStr: String, msgStr: String){
        let alert = UIAlertController(title: alertStr, message: msgStr, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.destructive, handler: {action in
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated:true, completion:nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
   
    @IBAction func signUpBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    
}

