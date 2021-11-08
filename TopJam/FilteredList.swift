//
//  FilteredList.swift
//

import CoreData
import SwiftUI

struct FilteredList: View{
    init(filter: String) {
        print("test test test")
        
        fetchRequest2 = FetchRequest<ListDataStore>(entity: ListDataStore.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ListDataStore.trackName, ascending: false)])
//        , predicate: NSPredicate(format: "trackName BEGINSWITH %@", filter)
        
        print(singers.count)
        for i in 0..<fetchRequest2.wrappedValue.count{
            print(fetchRequest2.wrappedValue[i].wrappedTrackName)
        }
    }
    
    var fetchRequest2: FetchRequest<ListDataStore>
//    var singers: FetchedResults<ListDataStore> { fetchRequest2.wrappedValue }
    @State private var singers: [ListDataStore] = [ListDataStore]()

    // this is our content closure; we'll call this once for each item in the list
    // let content: (T) -> Content
    
    var body: some View {
        List(singers, id: \.self) { singer in
            Text(singer.wrappedTrackName)
                .foregroundColor(.white)
        }
        
    }

   
}

