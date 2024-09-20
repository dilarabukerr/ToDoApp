//
//  BigButtonView.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import SwiftUI

struct BigButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 5) //arkaplan tanımladık
                    .foregroundColor(.purple)
                Text(title)
                    .foregroundStyle(.white)
            }
        })
        .frame(height: 50)
        .padding(.horizontal)
    }
}

#Preview {
    BigButton(title: "örnek button title", action: {})
}
