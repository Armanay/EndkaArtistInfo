//
//  TableViewCell.swift
//  Endka
//
//  Created by  Арманай  on 5/4/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var relasedYear: UILabel!
    
    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func albumInfo(album: Album){
            albumName.text = album.strAlbum
        relasedYear.text = album.intYearReleased
            genre.text = album.strGenre
               
           }
       


}
