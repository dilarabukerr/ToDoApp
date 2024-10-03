//
//  ToDoListViewViewModel.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel:ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    /// Delete to do list item
    /// - Parameter id: Item id to delete
    func delete (id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("toDos")
            .document(id)
            .delete()
    }
}
