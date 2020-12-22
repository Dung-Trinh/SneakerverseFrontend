//
//  SignUpViewModel.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 20.11.20.
//

import Foundation

class SignUpViewModel: ObservableObject{
    @Published var username: String = "TestUser3"
    @Published var password: String = "TestPassword"
    @Published var passwordVerify: String = "TestPassword"
    //@Published var passwordsAreNotTheSame: Bool
    @Published var responseMessage: SignUpStates = SignUpStates.DEFAULT
    
    var userService = UserService()
    
    func checkPasswordsAreTheSame(firstPW:String, secondPW: String) -> Bool{
        return firstPW == secondPW ? true : false
    }
    
    func signUp(username: String, password: String, completion: @escaping (Bool) -> Void){
        userService.sendSignUpRequest(username: username, password: password, completion: { response in
            switch response{
            case .success:
                completion(true)
            case .failure(_):
                completion(false)
            }
        })
    }
}
