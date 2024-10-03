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
                if let user = viewModel.user {
                    profile (user: user)
                } else {
                    Text("Profil yükleniyor...")
                }
           
                //Logout işlemi
                BigButton(title: "Çıkış Yap") {
                    viewModel.logout()
                }
                
            }
            .navigationTitle("Profil")
        }
        .onAppear{
            viewModel.fetchUser() //dataların yüklenmesi için.
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.purple)
            .frame(width: 125, height: 125)
        
        VStack {
            HStack {
                Text("İsim:")
                Text(user.name)
            }
            HStack {
                Text("Email")
                Text(user.email)
            }
            HStack {
                Text("Kayıt Tarihi")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
}

#Preview {
    ProfileView()
}
