//
//  TrackTableViewCell.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var trackDuration: UILabel!
    
private let networkManager = NetworkingManager()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func trackList(track: Track){
        trackName.text = track.strTrack
        let x: Int? = Int(track.intDuration!) ?? 0
        let m = x! / 1000 / 60
        let s = (x! / 1000) % 60
        trackDuration.text = "\(m): \(s)"
           }
     

}
