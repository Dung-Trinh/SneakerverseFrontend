//
//  LoginViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 19.11.20.
//

import SwiftUI

import Foundation

struct UserResponse: Codable{
    var data: String
    var accessToken: String
    var statusCode: Int?
    
    init(json: [String: Any]) {
        self.accessToken = json["accessToken"] as? String ?? ""
        self.data = json["data"] as? String ?? ""
        }
}

class LoginViewModel{
    var userResponse : UserResponse?
    var userService = UserService()
    
    func login(username:String, password:String) -> Bool{
        var success = false;
        let group = DispatchGroup()
        group.enter()

        userService.sendLoginRequest(username: username, password: password, completion:
            { json, error in
                success = json.accessToken != "" ? true : false
                // will be called at either completion or at an error.
                group.leave()
            })
        group.wait() // blocks current queue so beware!
        return success
    }
    

    
    func authorization() -> Bool{
        var success = false;
        let group = DispatchGroup()
        group.enter()

        userService.sendAuthorizationRequest(userResponse: userResponse)
            { json, error in
            success = json.accessToken != "" ? true : false
                // will be called at either completion or at an error.
                group.leave()
            }
        group.wait() // blocks current queue so beware!
        return success
    }
}
