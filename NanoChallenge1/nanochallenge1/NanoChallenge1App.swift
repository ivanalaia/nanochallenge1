//
//  NanoChallenge1App.swift
//  NanoChallenge1
//
//  Created by Ivan Alaia on 14/11/23.
//

import SwiftUI
import SwiftData

@main
struct NanoChallenge1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
        .modelContainer(for: NoteModel.self)
    }
}
