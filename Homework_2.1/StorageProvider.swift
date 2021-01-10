//
//  StorageProvider.swift
//  Homework_2.1
//
//  Created by Sasha on 10/01/2021.
//

import Foundation

protocol StorageProvider {
    static var shared: StorageProvider { get }
    func addUser(_ user: User)
    func dropUser(_ id: String)
    func editUser(_ user: User)
    func isUserExist(by name: String) -> Bool
    func getUser(by name: String) -> User?
    func getAllUsers() -> [User]
    func getAllRegularUsers() -> [RegularUser]
}
