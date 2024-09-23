//
//  RegisterView.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel() //değişkenleri oluşturduğumuz sınıftan aldık.
    
    var body: some View {
        NavigationStack { // Sayfalar arası geçiş için
            VStack { //Alt alta komponent dizmek için
                //Header Kısmı
                HeaderView()
                
                //Register Formu
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    Section(header: Text("Kayıt Formu")) {
                        TextField("Tam adınız ", text: $viewModel.name)
                            .autocorrectionDisabled()//otomatik tamamlamayı kapatıyo
                        TextField("E-mail Adresiniz", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)//baş harf büyültmeyi kapatıyor
                        SecureField("Şifreniz", text: $viewModel.password)
                    }
                }
                .frame(height: 200)
                
                BigButton(title: "Kayıt Ol", action: {viewModel.register()})
                Spacer()
            }
        }
        
    }
}
#Preview {
    RegisterView()
}
