//
//  ListData.swift
//  TopJam
//
//  Created by Alex on 2021-11-05.
//
/*
        "track_uri": "spotify:track:0gplL1WMoJ6iYaPgMCL0gX",
        "trackName": "Easy On Me",
        "artists_uri": "spotify:artist:4dpARuHxo51G3z768sgnrY",
        "artistName": "Adele",
        "album_uri": "spotify:album:224jZ4sUX7OhAuMwaxp86S",
        "albumName": "Easy On Me",
        "album_artists_uri": "spotify:artist:4dpARuHxo51G3z768sgnrY",
        "album_artistName": "Adele",
        "releaseDate": "2021-10-14",
        "Image": "https://i.scdn.co/image/ab67616d0000b27350dba34377a595e35f81b0e4",
        "discNum": "1",
        "trackNum": "1",
        "duration": "224694",
        "preview_url": "https://p.scdn.co/mp3-preview/c5014be1aeb2ab5f129e2789eff3ea87ecd5027f?cid=9950ac751e34487dbbe027c4fd7f8e99",
        "explicit": "false",
        "pop_rating": "100",
        "added_by": "spotify:user:billboard.com",
        "added_at": "2021-10-19T14:59:59Z"
 */
import SwiftUI

struct ListData: Codable, Hashable{


    var track_uri: String
    var trackName: String
    
    var artists_uri: String
    var artistName: String
    
    var album_uri: String
    var albumName: String
    var album_artists_uri: String
    var album_artistName: String
    
    var releaseDate: String
    var Image: String
    
    var discNum: String
    var trackNum: String
    
    var duration: String
    var preview_url: String?
    var explicit: String
    var pop_rating: String
    
    var added_by: String
    var added_at: String
    
    static let example = ListData(track_uri: UUID().uuidString, trackName: "error", artists_uri: "error", artistName: "error", album_uri: "error", albumName: "error", album_artists_uri: "error", album_artistName: "error", releaseDate: "error", Image: "error", discNum: "error", trackNum: "error", duration: "error", preview_url: "error", explicit: "error", pop_rating: "123", added_by: "error", added_at: "error")

}
