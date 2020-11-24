//
//  SignUpView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 19.11.20.
//

import SwiftUI

enum SignUpStates: String{
    case DEFAULT = ""
    case SIGNUPFAILED = "Sign Up failed"
    case SUCCESSFUL = "Sign Up successfull"
    case PASSWORDFAILED = "Passwords are not the same"
}

struct SignUpView: View {
    @State var username: String = "TestUser3"
    @State var password: String = "TestPassword"
    @State var passwordVerify: String = "TestPassword3"
    //@State var passwordsAreNotTheSame: Bool
    @State var responseMessage: SignUpStates = SignUpStates.DEFAULT
    @State var viewModel: SignUpViewModel = SignUpViewModel()
    var body: some View {
        NavigationView{
            VStack {
                Title(text:"Registrieren")
                CustomTextField(storedText: $username, placholderText: "Username", type: .TEXT, icon: Image(systemName: "person.fill"))
                CustomTextField(storedText: $password, placholderText: "Password", type: .PASSWORD)
                CustomTextField(storedText: $passwordVerify, placholderText: "Password wiederholen", type: .PASSWORD)
                ResponseSignUp(message: $responseMessage)
                Button(action: {
                    if(viewModel.checkPasswordsAreTheSame(firstPW: password, secondPW: passwordVerify)){
                        let successfullSignUp = viewModel.signUp(username: username, password: password)
                        responseMessage = successfullSignUp ? SignUpStates.SUCCESSFUL : SignUpStates.SIGNUPFAILED
                    }else{
                        responseMessage = SignUpStates.PASSWORDFAILED
                    }
                }){
                    CustomButton(buttonText: "Sign Up", buttonColour: .blue)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
