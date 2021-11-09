//
//  TopJamApp.swift
//  TopJam
//
//  Created by Alex on 2021-11-05.
//

import SwiftUI

@main
struct TopJamApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
