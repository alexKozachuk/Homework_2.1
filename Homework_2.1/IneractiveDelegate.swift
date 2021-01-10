//
//  IneractiveDelegate.swift
//  Homework_2.1
//
//  Created by Sasha on 10/01/2021.
//

import Foundation

protocol BetsInteractiveDelegate {
    func makeBet(bet: String)
    func getBets() -> [String]
}

protocol UserInteractiveDelegate {
    func getUsers() -> [RegularUser]
    func changeUserStatus(name: String, isBan: Bool)
}

protocol StorageInteractiveDelegate {
    var storage: StorageProvider { get }
    var userId: String { get }
}
