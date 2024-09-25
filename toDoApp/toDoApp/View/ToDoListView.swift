//
//  ToDoListView.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import SwiftUI

struct ToDoListView: View {
    
    @StateObject var viewModel = ToDoListViewViewModel()
    private let userID: String
    init(userID:String){
        self.userID = userID
        
    }

    var body: some View {
        NavigationView {
            VStack {
                
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
    ToDoListView(userID: "test")
}
