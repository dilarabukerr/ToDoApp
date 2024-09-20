//
//  RegisterViewViewModel.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import Foundation
import FirebaseAuth

class RegisterViewViewModel: ObservableObject { //gözlemlenebilir obje
     
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    
    init(){}
    
    func register() {
        
        guard validate() else{
            return
        }
    }
    
    func validate () -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Lütfen tüm alanları doldurunuz!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir e-mail giriniz."
            return false
        }
        
        guard password.count >= 6 else { //şifre 6 karakterden fazla olsun
            
            errorMessage = "Lütfen 6 karakterden fazla karakterli şifre belirleyin."
            return false
        }
        return true
    }
}
