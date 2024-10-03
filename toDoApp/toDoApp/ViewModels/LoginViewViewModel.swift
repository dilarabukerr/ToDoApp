////
////  LoginViewViewModel.swift
////  toDoApp
////
////  Created by Dilara Büker on 19.09.2024.
////
//
//import Foundation
//
//class LoginViewViewModel: ObservableObject { //Gözlemlenebilir obje
//    @Published var email = ""
//    @Published var password = ""
//    @Published var errorMessage = ""
//    
//    init() {}
//    
//    
//    func login() {
//        guard validate() else{
//            return
//        }
//    }
//    
//    func validate() -> Bool {
//        errorMessage = ""
//        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
//        !password.trimmingCharacters(in: .whitespaces).isEmpty
//        else {
//            errorMessage = "Lütfen tüm alanları doldurun."
//            return false //kullanıcının gönderdiği emaildeki boşlukları sil bu string boşsa return et
//        }
//        guard email.contains("@") && email.contains(".") // email için gerekli kontroller.
//        else {
//            errorMessage = "Lütfen geçerli e-mail girin."
//            return false
//        }
//        return true
//    }
//    
//}

import Foundation
import FirebaseAuth // Firebase Authentication kütüphanesi

class LoginViewViewModel: ObservableObject { // Gözlemlenebilir obje
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        // Öncelikle form validasyonu yapılır
        guard validate() else {
            return
        }
        
        // Firebase ile giriş yapma işlemi
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self = self else { return }
            
            // Hata durumu
            if let error = error {
                self.errorMessage = "Giriş yapılamadı: \(error.localizedDescription)"
                return
            }
            
            // Başarılı giriş durumu
            self.errorMessage = "Giriş başarılı!"
            print("Giriş başarılı!")
        }
    }
    
    // Email ve şifre validasyonu
    func validate() -> Bool {
        errorMessage = ""
        
        // Email ve şifre boş mu kontrolü
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Lütfen tüm alanları doldurun."
            return false
        }
        
        // Email formatı geçerli mi kontrolü
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir e-posta adresi girin."
            return false
        }
        
        // Şifre uzunluğu yeterli mi kontrolü (opsiyonel, örnek olarak 6 karakter kontrolü)
        guard password.count >= 6 else {
            errorMessage = "Şifre en az 6 karakter olmalıdır."
            return false
        }
        
        return true
    }
}
