//
//  LoginViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 19.11.20.
//

import SwiftUI

import Foundation

class LoginViewModel: ObservableObject{
    @Published var username: String = "Hoang"
    @Published var password: String = "password"
    
    @Published var loginMessage: LoginStates = LoginStates.DEFAULT
    @Published var successfulAuth: Bool = false
    
    let userService = UserService()
    
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        userService.sendLoginRequest(username: username, password: password, completion: { response in
            switch response {
            case .success:
                completion(true)
            case .failure:
                completion(false)
            }
        })
    }
}
