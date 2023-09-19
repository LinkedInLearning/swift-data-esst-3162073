//
//  TS_BookClubApp.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 19.09.23.
//

import SwiftUI
import SwiftData

@main
struct TS_BookClubApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Author.self, Book.self])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
