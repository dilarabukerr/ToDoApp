//
//  ProfileView.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    init(){}
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Profil")
        }
    }
}

#Preview {
    ProfileView()
}
