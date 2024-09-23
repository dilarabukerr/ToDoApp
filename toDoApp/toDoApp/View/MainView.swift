//
//  ContentView.swift
//  toDoApp
//
//  Created by Dilara Büker on 18.09.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserID.isEmpty {
            ToDoListView()
        } else {
            LoginView()
        }
    }
}
    
#Preview {
    MainView()
}
