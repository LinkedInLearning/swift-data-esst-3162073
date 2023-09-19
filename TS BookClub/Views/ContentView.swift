//
//  ContentView.swift
//  TS BookClub
//
//  Created by Thomas Sillmann on 19.09.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BooksList()
                .tabItem {
                    Label("Books", systemImage: "book")
                }
            AuthorsList()
                .tabItem {
                    Label("Authors", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView()
}
