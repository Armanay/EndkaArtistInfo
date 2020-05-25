//
//  FavouriteTableViewCell.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    @IBOutlet weak var favImage: UIImageView!
    @IBOutlet weak var nameArtist: UILabel!
    
    private let networkManager = NetworkingManager()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func favList(artist: Artist){
        
        nameArtist.text = artist.strArtist
        self.networkManager.loadImage(url: artist.strArtistThumb ) { (data) in
                                   self.setImage(data: data)
                               }
             }
      private func setImage(data: Data) {
              favImage.image = UIImage(data: data)
         }
}
