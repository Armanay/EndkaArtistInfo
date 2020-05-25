//
//  FavouriteTableViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit
import FirebaseAuth
class FavouriteTableViewController: UITableViewController {
  var artists = [Artist]()
    var artistobject: Artist? = nil
    var name: String? = nil
            override func viewDidLoad() {
                super.viewDidLoad()
                if Auth.auth().currentUser != nil{
                    if let data = UserDefaults.standard.value(forKey: Auth.auth().currentUser!.uid) as? Data{
                               artists = try! PropertyListDecoder().decode(Array<Artist>.self, from: data)
                        }
                    tableView.reloadData()
                        
                }
                else {
                    showToast(message: "Sign In Please")
                }
    }
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return self.artists.count
            }
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "favArtist", for: indexPath)  as! FavouriteTableViewCell
                cell.favList(artist: artists[indexPath.row])
                self.artistobject = artists[indexPath.row]
                self.name = artists[indexPath.row].strArtist!
                return cell
            }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toArtistInfo"{
            let tableViewController = segue.destination as? ArtistInfoViewController
            tableViewController?.artist = self.artistobject
            tableViewController?.name = self.name!
        }
    }
}
