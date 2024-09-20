//
//  LoginViewViewModel.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import Foundation

class LoginViewViewModel: ObservableObject { //Gözlemlenebilir obje
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    
    func login() {
        guard validate() else{
            return
        }
    }
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
        !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Lütfen tüm alanları doldurun."
            return false //kullanıcının gönderdiği emaildeki boşlukları sil bu string boşsa return et
        }
        guard email.contains("@") && email.contains(".") // email için gerekli kontroller.
        else {
            errorMessage = "Lütfen geçerli e-mail girin."
            return false
        }
        return true
    }
    
}
