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
}

struct SignUpView: View {
    @State var username: String = "TestUser3"
    @State var password: String = "TestPassword3"
    //@State var passwordsAreNotTheSame: Bool
    @State var responseMessage: SignUpStates = SignUpStates.DEFAULT
    @State var viewModel: SignUpViewModel = SignUpViewModel()
    var body: some View {
        NavigationView{
            VStack {
                Title(text:"Registrieren")
                CustomTextField(storedText: $username, placholderText: "Username", type: .USERNAME)
                CustomTextField(storedText: $password, placholderText: "Password", type: .PASSWORD)
                CustomTextField(storedText: $password, placholderText: "Password", type: .PASSWORD)
                ResponseSignUp(message: $responseMessage)
                Button(action: {
                    let successfullSignUp = viewModel.signUp(username: username, password: password)
                    responseMessage = successfullSignUp ? SignUpStates.SUCCESSFUL : SignUpStates.SIGNUPFAILED
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
