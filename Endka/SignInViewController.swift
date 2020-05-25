//
//  SignInViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignInViewController: UIViewController {
    @IBOutlet weak var email: UILabel!

    @IBOutlet weak var writeEmail: UITextField!
    @IBOutlet weak var writePassword: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBAction func signIn(_ sender: UIButton) {
        signin()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   func signin(){
          let emailText: String = self.writeEmail.text!
          let passwordText: String = self.writePassword.text!
          if (emailText.isEmpty || passwordText.isEmpty ){
                     showToast(message: "Tupoi chtole?")
                 }
                 else{
           print(emailText)
           print(passwordText)
          Auth.auth().signIn(withEmail: emailText, password: passwordText){
              (result,error) in
              if let error = error {
                  print( error.localizedDescription)
              return
              }
            self.dismiss(animated: true, completion: nil)
//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//               let signInViewController = storyBoard.instantiateViewController(withIdentifier: "main") as! ViewController
//               self.present(signInViewController, animated: true, completion: nil)


              }
          }

         
          
      }

}
extension UIViewController {
func showToast(message : String) {
    let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
    toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    toastLabel.textColor = UIColor.white
    
    toastLabel.textAlignment = .center;
    toastLabel.text = message
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
         toastLabel.alpha = 0.0
    }, completion: {(isCompleted) in
        toastLabel.removeFromSuperview()
    })
    }}
