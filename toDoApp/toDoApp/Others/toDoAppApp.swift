//
//  toDoAppApp.swift
//  toDoApp
//
//  Created by Dilara Büker on 18.09.2024.
//

import SwiftUI
import FirebaseCore

@main
struct toDoAppApp: App {
    init () {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
