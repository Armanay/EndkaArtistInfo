//
//  SecondViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/5/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var albumname: UILabel!
    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var des: UITextView!
    @IBOutlet weak var image: UIImageView!
    private let networkManager = NetworkingManager()
    var name: String?=nil
    var albumId: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.loadAlbumDetail(onSuccess: { (info) in
            self.albumInfo(albums: info.album)
        }, onFailure: { (error) in
            print(error)
        }, key: name!)
        
    }
    func albumInfo(albums: [Album]){
           for album in albums{
           albumname.text = album.strAlbum
           artist.text = album.strArtist
           des.text = album.strDescriptionEN
            self.networkManager.loadImage(url: album.strAlbumThumb ?? "") { (data) in
                   self.setImage(data: data)
            
               }
            self.albumId = album.idAlbum
              
           }
       }
    private func setImage(data: Data) {
            image.image = UIImage(data: data)
       }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toTrack"{
        let tableViewController = segue.destination as? TrackTableViewController
        tableViewController?.albumId = self.albumId
        
        }
}
}
