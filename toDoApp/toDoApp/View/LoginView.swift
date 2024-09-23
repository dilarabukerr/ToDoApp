//
//  LoginView.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import SwiftUI

struct LoginView: View {
//    @State var email = ""
//    @State var password = "" //değişken tanımlamaları
    
    @StateObject var viewModel = LoginViewViewModel() //oluşturduğumuz sınıftan aldık, kod karmaşasının önüne geçmiş oluyoruz.
    
    var body: some View {
        NavigationStack { //sayfalar arası geçiş için
            VStack { //alt alta komponent yerleştirmek içn
                
                //Header
               HeaderView()
                
                //Form : email, şifre, buton
                Form {
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("E-mail Adresiniz ", text: $viewModel.email) //kullanıcıdan input alma
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)//baş harf büyültmeyi kapatıyor
                    SecureField("Şifreniz ", text: $viewModel.password) //şifrenin *** şeklinde görünmesi için.
                }
                .frame(height: 150)
                
                BigButton(title: "Giriş Yap", action: {viewModel.login()})
                Spacer()
                
                //Footer: hesap var mı yok mu?
                VStack {
                    Text("Buralarda yeni misin?")
                    NavigationLink("Yeni Hesap Oluştur!",destination: RegisterView())
                }
                .padding(.bottom,50)
                
            }
        }
        
    }
}
#Preview {
    LoginView()
}
