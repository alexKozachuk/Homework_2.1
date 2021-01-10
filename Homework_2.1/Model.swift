//
//  Model.swift
//  Homework_2.1
//
//  Created by Sasha on 04/01/2021.
//

import Foundation

enum UserType {
    case regular
    case admin
}

protocol User {
    var name: String { get set }
    var password: String { get set }
}

struct RegularUser: User {
    var name: String
    var password: String
    var bets: [String] = []
    var isBanned: Bool = false
}

struct AdminUser: User {
    var name: String
    var password: String
}
