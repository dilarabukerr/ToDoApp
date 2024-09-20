//
//  HeaderView.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Image("spark")
                .resizable()
                .frame(width: 150, height: 150)
        }
    }
}
#Preview {
    HeaderView()
}
