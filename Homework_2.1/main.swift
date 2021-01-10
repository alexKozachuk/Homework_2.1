//
//  main.swift
//  Homework_2.1
//
//  Created by Sasha on 04/01/2021.
//

import Foundation

var authService = AuthorizationService.share

do {

    // Реєстрація звичайного юзера і адміну
    try authService.registration(name: "Alex", password: "111", userType: .regular)
    try authService.registration(name: "Alex1", password: "111", userType: .admin)
    
    // Авторизація
    let service = try authService.logIn(name: "Alex", password: "111")
    //let service = try authService.logIn(name: "Alex1", password: "111")
    
    switch service {
    case is BetsInteractiveDelegate:
        let userService = service as! BetsInteractiveDelegate
        
        userService.makeBet(bet: "1")
        userService.makeBet(bet: "2")
        print(userService.getBets())
        
    case is UserInteractiveDelegate:
        
        let adminService = service as! UserInteractiveDelegate
        
        var users = adminService.getUsers()
        print(users)
        if let firstUser = users.first {
            adminService.changeUserStatus(name: firstUser.name, isBan: true)
        }
        users = adminService.getUsers()
        print(users)
        
    default:
        print("Error type of user ")
    }
    
} catch AuthorizationError.invalidPassword {
    print("AuthorizationError.invalidPassword")
} catch AuthorizationError.isBanned {
    print("AuthorizationError.isBanned")
} catch AuthorizationError.userNotExist {
    print("AuthorizationError.userNotExist")
} catch RegistrationError.nameIsBusy {
    print("RegistrationError.nameIsBusy")
} catch {
    print("Error")
}






