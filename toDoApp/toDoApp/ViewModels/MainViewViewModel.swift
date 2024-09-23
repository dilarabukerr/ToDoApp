//
//  MainViewViewModel.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import Foundation
import Firebase
import FirebaseAuth

class MainViewViewModel:ObservableObject {
    @Published var currentUserID: String = ""
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
