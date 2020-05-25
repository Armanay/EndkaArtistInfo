//
//  VideoTableViewController.swift
//  Endka
//
//  Created by  Арманай  on 5/16/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import UIKit

class VideoTableViewController: UITableViewController {
      var artistId: String?=nil
      var videoList: [Video] = []
      private let networkManager = NetworkingManager()
        override func viewDidLoad() {
            super.viewDidLoad()
             networkManager.loadArtistVideos(onSuccess: { (videoList) in
                self.videoList = videoList.mvids
                self.tableView.reloadData()
                          }, onFailure: { (error) in
                              print(error)
                          }, key: artistId!)
        }
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.videoList.count
        }
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath)  as! VideoTableViewCell
            cell.videoList(video: videoList[indexPath.row])
            return cell
        }
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "toSecond"{
//                let tableViewController = segue.destination as? SecondViewController
//                tableViewController?.name = alname
//            }
//        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: videoList[indexPath.row].strMusicVid!) else { return }
       UIApplication.shared.open(url)
    }
}
