//
//  ToDoListItemView.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item:ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970:item.dueDate).formatted(date:.abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button{
                viewModel.toggleIsDone(item: item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill": "circle")
                    .foregroundStyle(Color.blue)
            }
        }
    }
}
#Preview {
    ToDoListItemView(item:.init(
        id:"123",
        title: "görevler",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
