//
//  RegisterViewController.swift
//  FireBaseLogin
//
//  Created by Apple8 on 23/11/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseAppCheckInterop

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var passwrdTxtFld: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        if self.emailTxtFld.text == "" && self.emailTxtFld.text?.count == 0{
            self.ShowDismiss(alertStr: "Message", msgStr: "Please Enter Valid Email")
        }
        if self.passwrdTxtFld.text == "" && self.passwrdTxtFld.text?.count == 0{
            self.ShowDismiss(alertStr: "Message", msgStr: "Please Enter Valid Password")
        }
        self.SignUp()
        
    }
    
    func SignUp(){
        Auth.auth().createUser(withEmail: self.emailTxtFld.text!, password: self.passwrdTxtFld.text!) { authResult, error in
            print(authResult as Any)
            if authResult?.user.email == self.emailTxtFld.text{
                self.ShowSuccess(alertStr: "Message", msgStr: "User Created Successfully!")
            }else{
                self.ShowDismiss(alertStr: "Message", msgStr: "No user found!")
            }
            print(error)
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
            self.dismiss(animated: true)
            self.dismiss(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
