//
//  ArtistInfoViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit
import FirebaseAuth
class ArtistInfoViewController: UIViewController {
    @IBOutlet weak var artimage: UIImageView!
    @IBOutlet weak var artLogo: UIImageView!
    @IBOutlet weak var artname: UILabel!
    @IBOutlet weak var bornyear: UILabel!
    @IBOutlet weak var biography: UITextView!
    @IBOutlet weak var website: UILabel!
    private let networkManager = NetworkingManager()

    var artist: Artist? = nil
    var artists = [Artist]()
    var name: String = " "
    override func viewDidLoad() {
        super.viewDidLoad()
        artistInfo(artist: artist!)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAlbum"{
            let tableViewController = segue.destination as? TableViewController
            tableViewController?.artistname = artist?.strArtist
        }
        else if segue.identifier == "toKlip"{
        let tableViewController = segue.destination as? VideoTableViewController
            tableViewController?.artistId = artist?.idArtist
        }
    }
    func artistInfo(artist: Artist){
           artname.text = artist.strArtist
           bornyear.text = artist.intBornYear
           website.text = artist.strWebsite
           biography.text = artist.strBiographyEN
               self.networkManager.loadImage(url: artist.strArtistThumb) { (data) in
                   self.setImage(data: data)
               }
              self.networkManager.loadImage(url: artist.strArtistLogo) { (data) in
                             self.setLogo(data: data)
                         }
           }
           
       


       private func setImage(data: Data) {
            artimage.image = UIImage(data: data)
       }
       private func setLogo(data: Data) {
            artLogo.image = UIImage(data: data)
       }

   
            
    }


