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
            accountView
            
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userID: viewModel.currentUserID)
            .tabItem {
                Label("Home", systemImage: "house")
            }
            ProfileView()
            .tabItem {
                Label("Profi", systemImage: "person.circle")
            }
        }
    }
}
    
#Preview {
    MainView()
}
