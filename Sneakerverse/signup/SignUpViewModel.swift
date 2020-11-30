//
//  SignUpViewModel.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 20.11.20.
//

import Foundation


class SignUpViewModel{
    var userService = UserService()
    
    func checkPasswordsAreTheSame(firstPW:String, secondPW: String) -> Bool{
        return firstPW == secondPW ? true : false
    }
    
    func signUp(username: String, password: String) -> Bool{
        var success = false;
        let group = DispatchGroup()
        group.enter()
        
        userService.sendSignUpRequest(username: username, password: password, completion:
                                        { response in
                                            success = response!.accessToken != "" ? true : false
                                            // will be called at either completion or at an error.
                                            group.leave()
                                        })
        group.wait() // blocks current queue so beware!
        return success
    }
}
