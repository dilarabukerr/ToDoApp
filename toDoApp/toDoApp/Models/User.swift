//
//  User.swift
//  toDoApp
//
//  Created by Dilara Büker on 19.09.2024.
//

import Foundation

struct User: Codable { //json dosyasından modele çevrilebiliyor
    
    let id: String
    let name:String
    let email: String
    let joined: TimeInterval
}
