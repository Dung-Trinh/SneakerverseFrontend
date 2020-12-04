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
//    func login(username:String, password:String) -> Bool{
//        var success = false;
//        let group = DispatchGroup()
//        group.enter()
//
//        userService.sendLoginRequest(username: username, password: password, completion:
//                                        {
//                                            response in
//                                            if(response?.statusCode == 200){
//                                                success = true
//                                            }
//                                            print(response ?? "")
//
//                                            // will be called at either completion or at an error.
//                                            group.leave()
//                                        })
//        group.wait() // blocks current queue so beware!
//        return success
//    }
}
