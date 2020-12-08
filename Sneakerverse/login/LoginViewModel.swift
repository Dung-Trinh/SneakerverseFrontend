//
//  LoginViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 19.11.20.
//

import SwiftUI

import Foundation
import PromiseKit

struct LoginViewModel{
    var userService = UserService()
    var accessToken:String?
    
    func login(username:String, password:String, completion: @escaping (Bool)->Void) {
        userService.sendLoginRequest(username: username, password: password, completion: {response in
            completion(response?.statusCode == 200)
        })
    }
}
