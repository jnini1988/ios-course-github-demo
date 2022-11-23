//
//  Song.swift
//  sc2628_p4
//
//  Created by Jenny Chen on 10/22/22.
//

import UIKit

class Song{
    var songPicName: String
    var songName: String
    var artist: String
    var playlist: String

    init(songPicName: String, songName: String, artist:String, playlist:String) {
        self.songPicName = songPicName
        self.songName = songName
        self.artist = artist
        self.playlist = playlist
    }
}
