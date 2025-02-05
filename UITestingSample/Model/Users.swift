//
//  Users.swift
//  UITestingSample
//
//  Created by Anmol Arora on 05/02/25.
//

import Foundation

struct Users: Decodable {
    var users: [User]
}

struct User: Decodable {
    var firstName: String
    var lastName: String
    var age: Int
}
