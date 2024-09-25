//
//  NewItemViewViewModel.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import Foundation

class NewItemViewViewModel: ObservableObject{
    //@Published, kullanıcı arayüzünde dinamik değişiklikleri desteklemek için kullanılır.
    @Published var title = ""
    @Published var dueDate = Date() // bitiş tarihi
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
