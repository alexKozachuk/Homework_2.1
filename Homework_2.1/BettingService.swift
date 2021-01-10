//
//  BettingService.swift
//  Homework_2.1
//
//  Created by Sasha on 04/01/2021.
//

import Foundation

final class UserService: StorageInteractiveDelegate {
    
    let storage = Storage.shared
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
}

extension UserService: BetsInteractiveDelegate {
    
    func makeBet(bet: String) {
        guard var currentUser = storage.getUser(by: userId) as? RegularUser else {
            return
        }
        currentUser.bets.append(bet)
        storage.editUser(currentUser)
    }
    
    func getBets() -> [String] {
        guard let currentUser = storage.getUser(by: userId) as? RegularUser else { return [] }
        return currentUser.bets
    }
}


final class AdminService: StorageInteractiveDelegate {
    
    let storage = Storage.shared
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
}

extension AdminService: UserInteractiveDelegate {
    
    func getUsers() -> [RegularUser] {
        storage.getAllRegularUsers()
    }
    
    func changeUserStatus(name: String, isBan: Bool) {
        guard var currentUser = storage.getUser(by: name) as? RegularUser else { return }
        currentUser.isBanned = isBan
        storage.editUser(currentUser)
    }
    
}
