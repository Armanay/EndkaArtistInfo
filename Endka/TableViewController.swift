//
//  TableViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/4/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var artistname: String?=nil
    var alname: String? = nil
    //var albums: [Decodable] = []
    var albums: [Album] = []
      private let networkManager = NetworkingManager()
    override func viewDidLoad() {
        super.viewDidLoad()
       
         networkManager.loadArtistAlbum(onSuccess: { (artistalbum) in
            self.albums = artistalbum.album
            self.tableView.reloadData()
            
                      }, onFailure: { (error) in
                          print(error)
                      }, key: artistname!)
        
       
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.albums.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "album", for: indexPath)  as! TableViewCell
        cell.albumInfo(album: albums[indexPath.row])
        alname = albums[indexPath.row].strAlbum
        ////cell.textLabel?.text = albums[indexPath.row].strAlbum
        return cell
          
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond"{
            let tableViewController = segue.destination as? SecondViewController
            tableViewController?.name = alname
        }
    }

}
    

    

    

   

    


