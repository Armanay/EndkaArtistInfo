//
//  VideoTableViewCell.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit
import AlamofireImage
class VideoTableViewCell: UITableViewCell {
    @IBOutlet weak var trackPhoto: UIImageView!
    @IBOutlet weak var trackName: UILabel!
      private let networkManager = NetworkingManager()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func videoList(video: Video){
        trackName.text = video.strTrack
        self.networkManager.loadImage(url: video.strTrackThumb ?? "") { (data) in
                                 self.setImage(data: data)
                             }
           }
    private func setImage(data: Data) {
            trackPhoto.image = UIImage(data: data)
       }
    
}
