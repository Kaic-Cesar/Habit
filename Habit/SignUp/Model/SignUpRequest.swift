//
//  SignUpRequest.swift
//  Habit
//
//  Created by Kaic Cesar on 20/06/24.
//

import Foundation

// Encodable -> Codifica para JSON
struct SignUpRequest: Encodable {

    let fullName: String
    let email: String
    let password: String
    let document: String
    let phone: String
    let gender: Int
    let birthday: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "name"
        case email
        case password
        case document
        case phone
        case birthday
        case gender
    }
}
