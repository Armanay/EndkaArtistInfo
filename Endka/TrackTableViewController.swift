//
//  TrackTableViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit

class TrackTableViewController: UITableViewController {

  var albumId: String? = ""
        var trackList: [Track] = []
        private let networkManager = NetworkingManager()
          override func viewDidLoad() {
              super.viewDidLoad()
               networkManager.loadAlbumTracks(onSuccess: { (trackList) in
                self.trackList = trackList.track
                  self.tableView.reloadData()
                            }, onFailure: { (error) in
                                print(error)
                            }, key: albumId!)
          }
          override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return self.trackList.count
          }
          override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
              let cell = tableView.dequeueReusableCell(withIdentifier: "trackCell", for: indexPath)  as! TrackTableViewCell
              cell.trackList(track: trackList[indexPath.row])
              return cell
          }
  
     
}
