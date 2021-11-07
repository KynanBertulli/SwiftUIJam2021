//
//  FilteredList.swift
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }

    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        print("test test test")
        fetchRequest = FetchRequest<T>(entity: ListDataStore.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH [c] %@", filterKey, filterValue))
        print(fetchRequest.wrappedValue)
        self.content = content
    }
}

