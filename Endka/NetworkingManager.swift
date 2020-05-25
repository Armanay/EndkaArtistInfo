//
//  NetworkingManager.swift
//  Endka
//
//  Created by  Арманай  on 5/3/20.
//  Copyright © 2020  Арманай . All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
class NetworkingManager {
    
    private let ARTISTS_ENDPOINT = "https://theaudiodb.com/api/v1/json/1"
    
  
    
    func loadImage(url: String, onSuccess: @escaping (Data) -> Void) {
        AF.request(url).responseImage { (image) in
            onSuccess(image.data ?? Data())
        }
    }
   
    func loadArtistInfo(onSuccess: @escaping (ArtistInfo) -> Void, onFailure: @escaping (String) -> Void,key: String ){
        let params = [
            "s": key
        ]
        
        AF.request("\(ARTISTS_ENDPOINT)/search.php", method: .get, parameters: params).responseDecodable { (response: DataResponse<ArtistInfo, AFError>) in
            
            debugPrint(response)
            
            switch response.result {
            case .success(let artistResponse):
                onSuccess(artistResponse)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        }
    }
    
    func loadArtistAlbum(onSuccess: @escaping (ArtistAlbum) -> Void, onFailure: @escaping (String) -> Void,key: String ){
        let params = [
            "s": key
        ]
        
        AF.request("\(ARTISTS_ENDPOINT)/searchalbum.php", method: .get, parameters: params).responseDecodable { (response: DataResponse<ArtistAlbum, AFError>) in
            
            debugPrint(response)
            
            switch response.result {
            case .success(let artistAlbumResponse):
                onSuccess(artistAlbumResponse)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        }
    }
    func loadAlbumDetail(onSuccess: @escaping (AlbumDetail) -> Void, onFailure: @escaping (String) -> Void,key: String ){
        let params = [
            "a": key
        ]
        
        AF.request("\(ARTISTS_ENDPOINT)/searchalbum.php", method: .get, parameters: params).responseDecodable { (response: DataResponse<AlbumDetail, AFError>) in
            
            debugPrint(response)
            
            switch response.result {
            case .success(let albumDetailResponse):
                onSuccess(albumDetailResponse)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        }
    }
    func loadArtistVideos(onSuccess: @escaping (VideoList) -> Void, onFailure: @escaping (String) -> Void,key: String ){
        let params = [
            "i": key
        ]
        
        AF.request("\(ARTISTS_ENDPOINT)/mvid.php", method: .get, parameters: params).responseDecodable { (response: DataResponse<VideoList, AFError>) in
            
            debugPrint(response)
            
            switch response.result {
            case .success(let albumVideoResponse):
                onSuccess(albumVideoResponse)
            case .failure(let error):
                onFailure(error.localizedDescription)
            }
        }
    }
    func loadAlbumTracks(onSuccess: @escaping (TrackList) -> Void, onFailure: @escaping (String) -> Void,key: String ){
    let params = [
        "m": key
    ]
    
    AF.request("\(ARTISTS_ENDPOINT)/track.php", method: .get, parameters: params).responseDecodable { (response: DataResponse<TrackList, AFError>) in
        
        debugPrint(response)
        
        switch response.result {
        case .success(let albumTrackResponse):
            onSuccess(albumTrackResponse)
        case .failure(let error):
            onFailure(error.localizedDescription)
        }
    }
    }
}
