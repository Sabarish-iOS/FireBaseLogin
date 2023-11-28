//
//  ProfileViewController.swift
//  FireBaseLogin
//
//  Created by Apple8 on 23/11/23.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore
import FirebaseAppCheckInterop

class ProfileViewController: UIViewController {

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailVerifiedLbl: UILabel!
    @IBOutlet weak var refreshTokenLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if isEmailVerified{
            self.emailVerifiedLbl.text = "Verified"
        }else{
            self.emailVerifiedLbl.text = "Not Verified"
        }
        
        self.emailLbl.text = email
        self.refreshTokenLbl.text = refreshToken
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signOutBtnTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            nextViewController.modalPresentationStyle = .fullScreen
            self.present(nextViewController, animated:true, completion:nil)
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
        }
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
