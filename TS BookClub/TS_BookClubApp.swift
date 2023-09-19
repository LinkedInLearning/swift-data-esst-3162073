//
//  TS_BookClubApp.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 19.09.23.
//

import SwiftUI

@main
struct TS_BookClubApp: App {
    @StateObject private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(dataManager)
    }
}
