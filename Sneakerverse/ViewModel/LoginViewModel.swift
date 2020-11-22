//
//  LoginViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 19.11.20.
//

import SwiftUI

import Foundation

struct LoginResponse: Codable{
    var data: String
    var accessToken: String
    var errorDescription: String
    
    init(json: [String: Any]) {
        self.accessToken = json["accessToken"] as? String ?? ""
        self.data = json["data"] as? String ?? ""
        self.errorDescription = json["errorDescription"] as? String ?? ""
    }
}

class LoginViewModel{
    var userService = UserService()
    var accessToken:String?
    
    func login(username:String, password:String) -> Bool{
        var success = false;
        let group = DispatchGroup()
        group.enter()
        
        userService.sendLoginRequest(username: username, password: password, completion:
                                        {
                                            json, statusCode in
                                            if(statusCode == 200){
                                                success = true
                                            }
                                            print(json ?? "")
                                            
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
