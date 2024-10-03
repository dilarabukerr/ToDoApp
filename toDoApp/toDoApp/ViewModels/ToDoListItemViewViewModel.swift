//
//  ToDoListItemViewViewModel.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class ToDoListItemViewViewModel: ObservableObject {

    init() {}
    
    // Bu fonksiyon, bir görev (ToDoListItem) tamamlandı/bitmedi durumunu (isDone) tersine çevirir.
    func toggleIsDone(item: ToDoListItem) {
        // Gelen öğeyi (item) kopyalayarak onun üzerinde değişiklik yapabilmek için.
        var itemCopy = item
        
        // Görevin tamamlanma durumu tersine çevrilir.
        // Örneğin, yapılmış ise yapılmadı olarak işaretlenir, yapılmamış ise yapılmış olur.
        itemCopy.setDone(!item.isDone)
        
        // Kullanıcının kimlik doğrulaması yapılmış mı diye kontrol eder.
        // Eğer kullanıcı oturum açmamışsa işlem yapılmaz.
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
       
        // güncellenen görevi (itemCopy) bulur ve veritabanında günceller.
        db.collection("users")
            .document(uid) // Kullanıcı kimliği ile belge (document) seçilir.
            .collection("toDos") // toDos koleksiyonu içerisine gider.
            .document(item.id) // Güncellenen görevi (id ile) bulur.
            .setData(itemCopy.asDictionary()) // Görevi sözlük (dictionary) formatında veritabanına kaydeder.
    }
}
