//
//  InfoClass.swift
//  Endka
//
//  Created by  Арманай  on 5/3/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import Foundation
import FirebaseFirestore
struct Artist: Decodable,Equatable,Encodable {
  let strArtist: String?
    let intBornYear: String
    let strGenre: String
    let strWebsite: String
    let strBiographyEN: String
    let strArtistThumb: String
    let strArtistLogo: String
    let idArtist: String?
}
struct ArtistInfo: Decodable{
    let artists: [Artist]
}
struct Album: Decodable {
    let strAlbum: String
    let intYearReleased: String
    let strGenre: String?
    let strAlbumThumb: String?
    let strArtist: String
    let strDescriptionEN: String?
    let idAlbum: String?
}

struct ArtistAlbum: Decodable {
    let album: [Album]
}
struct AlbumDetail: Decodable {
    let album: [Album]
}
struct Track: Decodable{
    let strTrack: String?
    let intDuration: String?
}
struct TrackList: Decodable {
    let track: [Track]
}
struct Video: Decodable{
    let strTrack: String?
    let strTrackThumb: String?
    let strMusicVid: String?

}
struct VideoList: Decodable {
    let mvids: [Video]
}
struct User{
    var email: String
    var username: String
    var uid:String
    var favs: [Artist]
    
    init?(data: [String: Any]) {
        
        guard let uid = data["uid"] as? String,
            let username = data["username"] as? String,
            let favs = data["favs"] as? [Artist],
            let email = data["email"] as? String else {
            return nil
        }
    
        
        self.uid = uid
        self.username = username
        self.email = email
        self.favs = favs
    }
    
}
