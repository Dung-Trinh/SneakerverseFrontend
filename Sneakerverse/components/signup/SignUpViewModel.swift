//
//  SignUpViewModel.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 20.11.20.
//

import Foundation

class SignUpViewModel: ObservableObject{
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var passwordVerify: String = ""
    @Published var navigateToHome: Bool = false
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
    
    func login(username:String, password: String){
        userService.sendLoginRequest(username: username, password: password, completion: { response in
            switch response{
            case .success:
                self.navigateToHome = true
            case .failure(_):
                print("loginFailure after Signup")
            }
        })
    }
}
