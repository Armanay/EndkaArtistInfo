//
//  SignUpViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
class SignUpViewController: UIViewController {
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var writeEmail: UITextField!
    @IBOutlet weak var writePassword: UITextField!
    @IBOutlet weak var password: UILabel!
    @IBOutlet weak var writeUsername: UITextField!
    @IBOutlet weak var username: UILabel!
    private var artists = [Artist]()
    @IBAction func signUp(_ sender: UIButton) {
        register()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func register(){
          
           let emailText: String = writeEmail.text!
           let passwordText: String = writePassword.text!
           let usernameText: String = writeUsername.text!
           if (emailText.isEmpty || passwordText.isEmpty || usernameText.isEmpty){
               showToast(message: "Tupoi chtole?")
           }
           else{
               Auth.auth().createUser(withEmail: emailText, password: passwordText){
               (result,error) in
               if let error = error {
               print(error.localizedDescription)
               return
               }
                self.saveUser(uid:(result?.user.uid)!, username: usernameText, email: emailText, password: passwordText)
               self.showToast(message: "molodec")
               self.dismiss(animated: false , completion : nil)
               print("User added")
                self.createFav(uid: (result?.user.uid)!)
                
            }
                      
           }
                      
                 }
       private func saveUser(uid:String , username: String , email: String , password: String){
       
           Firestore.firestore().collection("users").document(uid).setData(
           [
                                "uid" : uid,
                                "username" : username,
                                "email" : email,
                                "password" : password
                                ]
           )
          }
    private func createFav(uid: String){
        UserDefaults.standard.set(try? PropertyListEncoder().encode(artists),forKey: uid)
    }
       @IBAction func signup(_ sender: UIButton) {
       register()
          

   

}
}
