//
//  ToDoListView.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import SwiftUI
import FirebaseFirestore

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    //private let userID: String
    
    init(userID:String){
        //self.userID = userID
        self._items = FirestoreQuery(collectionPath: "users/\(userID)/toDos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userID))
    }

    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions{
                            Button("Sil"){
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
                //.listStyle(PlainListStyle())
            }
            .navigationTitle("Görevler")
            .toolbar {
                Button{
                    //Sheed açma kodlarını
                    viewModel.showingNewItemView = true
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                //sheet (alt pencere) gösterilir.
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    ToDoListView(userID: "Qa8iZtxHmXMLRHU5NqWC8AYx2iL2")
}
