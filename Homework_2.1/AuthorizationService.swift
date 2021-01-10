//
//  AuthorizationService.swift
//  Homework_2.1
//
//  Created by Sasha on 04/01/2021.
//

import Foundation

enum AuthorizationError: Error {
    case userNotExist
    case invalidPassword
    case isBanned
}

enum RegistrationError: Error {
    case nameIsBusy
}

final class AuthorizationService {
    
    private var storage = Storage.shared
    
    static var share = AuthorizationService()
    private init() {}

    func logIn(name: String, password: String) throws -> StorageInteractiveDelegate? {
        guard let user = storage.getUser(by: name) else {
            throw AuthorizationError.userNotExist
        }
        guard user.password == password else {
            throw AuthorizationError.invalidPassword
        }
        if let regularUser = user as? RegularUser {
            if regularUser.isBanned {
                throw AuthorizationError.isBanned
            }
        }
        
        switch user {
        case is RegularUser:
            return UserService(userId: user.name)
        case is AdminUser:
            return AdminService(userId: user.name)
        default:
            return nil
        }
        
    }
    
    func registration(name: String, password: String, userType: UserType) throws {
        
        guard !storage.isUserExist(by: name) else {
            throw RegistrationError.nameIsBusy
        }
        
        switch userType {
        case .admin:
            let user = AdminUser(name: name, password: password)
            storage.addUser(user)
        case .regular:
            let user = RegularUser(name: name, password: password)
            storage.addUser(user)
        }
        
        
    }
    
}
