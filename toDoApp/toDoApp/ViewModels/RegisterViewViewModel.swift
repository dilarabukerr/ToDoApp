//
//  RegisterViewViewModel.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


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
        
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, //kullanıcıdan gelen email ve şifre firebase'e iletiliyor.
            error in
            guard let userID = result?.user.uid else {
                return
            }
            
            //insert metodu çağırılacak.
            self?.insertUserRecord(id: userID)
        }
    }
    
    private func insertUserRecord (id: String) { //dataya kullanıcı oluşturmak için fonksiyon oluşturduk.
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) //  extensions içinde yazdığımız metod sayesinde dictionarye çeviriyoruz.
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
