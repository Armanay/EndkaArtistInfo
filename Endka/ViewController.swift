//
//  ViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/3/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import FirebaseAuth
import FirebaseFirestore
import CodableFirebase
class ViewController: UIViewController ,UISearchBarDelegate{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var biography: UITextView!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var Genre: UILabel!
    @IBOutlet weak var bornYear: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var Photo: UIImageView!
    @IBOutlet weak var favourite: UIButton!
    @IBOutlet weak var auth: UIButton!
    @IBOutlet weak var fav: UIBarButtonItem!
  
    
    @IBAction func fav(_ sender: UIButton) {
        print("oooooooooooooooo")
        saveUser()
    }
    private let networkManager = NetworkingManager()
    var artists = [Artist]()
    var artistId: String?=""
    var artistobj: Artist? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        checkUser()
       
    }
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           networkManager.loadArtistInfo(onSuccess: { (artist) in
            self.artistInfo(artists: artist.artists)
           }, onFailure: { (error) in
               print(error)
           }, key: searchText)
           
            
        }
    
    func artistInfo(artists: [Artist]){
        for artist in artists{
        artistName.text = artist.strArtist
        bornYear.text = artist.intBornYear
        Genre.text = artist.strGenre
        website.text = artist.strWebsite
        biography.text = artist.strBiographyEN
            self.networkManager.loadImage(url: artist.strArtistThumb) { (data) in
                self.setImage(data: data)
            }
           self.networkManager.loadImage(url: artist.strArtistLogo) { (data) in
                          self.setLogo(data: data)
                      }
            self.artistId = artist.idArtist
            self.artistobj = artist
           
        }
        
    }


    private func setImage(data: Data) {
         Photo.image = UIImage(data: data)
    }
    private func setLogo(data: Data) {
         Logo.image = UIImage(data: data)
    }
    private func checkUser(){
        if Auth.auth().currentUser != nil{
            auth.addTarget(self, action: #selector(signOut), for: .touchUpInside)
            auth.setTitle("Sign Out", for: .normal)
            
                    }
        else {
         
           auth.setTitle("Sign In", for: .normal)
            auth.addTarget(self, action: #selector(barButtonAction), for: .touchUpInside)
        }
    }
    @objc func signOut(){
        do {
            try Auth.auth().signOut()
            print("eeeeeee")
            self.dismiss(animated: true, completion: nil)
            super.viewWillAppear(true)
            auth.setTitle("Sign Out", for: .normal)
        }
       catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    @objc func barButtonAction(sender: UIButton!) {
        auth.setTitle("Sign In", for: .normal)
            self.dismiss(animated: true, completion: nil)
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let signInViewController = storyBoard.instantiateViewController(withIdentifier: "signin") as! SignInViewController
    self.present(signInViewController, animated: true, completion: nil)


    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "artistAlbum"{
            let tableViewController = segue.destination as? TableViewController
            tableViewController?.artistname = searchBar.text
        }
        else if segue.identifier == "toVideo"{
        let tableViewController = segue.destination as? VideoTableViewController
            tableViewController?.artistId = self.artistId
        }
    }
    private func saveUser(){
        if Auth.auth().currentUser != nil{
            
            if let data = UserDefaults.standard.value(forKey: Auth.auth().currentUser!.uid) as? Data{
            artists = try! PropertyListDecoder().decode(Array<Artist>.self, from: data)
            }
            if artists.contains(where: {$0.strArtist == artistobj!.strArtist}){
                showToast(message: "Takoi uzhe est'")
            }
            else{
                artists.append((artistobj ?? nil)!)
                UserDefaults.standard.set(try? PropertyListEncoder().encode(artists),forKey:
                    Auth.auth().currentUser!.uid)
                 showToast(message: "Dobavleno")
            }
          
        }
        else {
            showToast(message: "Sign in please")
        }
    }
   
 
}

