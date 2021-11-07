//
//  ListDataStore+CoreDataProperties.swift
//  
//
//  Created by Alex on 2021-11-06.
//
//

import Foundation
import CoreData


extension ListDataStore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ListDataStore> {
        return NSFetchRequest<ListDataStore>(entityName: "ListDataStore")
    }

    @NSManaged public var added_at: String?
    @NSManaged public var added_by: String?
    @NSManaged public var album_artistName: String?
    @NSManaged public var album_artists_uri: String?
    @NSManaged public var albumName: String?
    @NSManaged public var artistName: String?
    @NSManaged public var artists_uri: String?
    @NSManaged public var discNum: String?
    @NSManaged public var duration: String?
    @NSManaged public var explicit: String?
    @NSManaged public var image: String?
    @NSManaged public var pop_rating: String?
    @NSManaged public var preview_url: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var track_uri: String?
    @NSManaged public var trackName: String?
    @NSManaged public var trackNum: String?

    var wrappedTrackName: String {
        trackName ?? "Unknown"
    }
}
