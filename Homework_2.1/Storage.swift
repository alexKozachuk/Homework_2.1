//
//  Storage.swift
//  Homework_2.1
//
//  Created by Sasha on 04/01/2021.
//

import Foundation

class Storage {
    
    private var users: [String:User] = [:]
    static var shared: StorageProvider = Storage()
    private init() {}

}

extension Storage: StorageProvider {
    
    func addUser(_ user: User) {
        users[user.name] = user
    }
    
    func dropUser(_ id: String) {
        users[id] = nil
    }
    
    func editUser(_ user: User) {
        users[user.name] = user
    }
    
    func isUserExist(by name: String) -> Bool {
        return users[name] != nil
    }
    
    func getUser(by name: String) -> User? {
        return users[name]
    }
    
    func getAllUsers() -> [User] {
        return Array(users.values)
    }
    
    func getAllRegularUsers() -> [RegularUser] {
        return users.values.filter { $0 is RegularUser }.map { $0 as! RegularUser }
    }
    
}
