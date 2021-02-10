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
    @StateObject var signUpViewModel: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        NavigationView{
            if(!signUpViewModel.navigateToHome){
                VStack {
                    Title(text:"Registrieren")
                    
                    CustomTextField(storedText: $signUpViewModel.username, placholderText: "Username", type: .TEXT, icon: Image(systemName: "person.fill"))
                    CustomTextField(storedText: $signUpViewModel.password, placholderText: "Password", type: .PASSWORD)
                    CustomTextField(storedText: $signUpViewModel.passwordVerify, placholderText: "Password wiederholen", type: .PASSWORD)
                    
                    ResponseSignUp(message: $signUpViewModel.responseMessage)
                    
                    Button(action: {
                        if(signUpViewModel.checkPasswordsAreTheSame(firstPW: signUpViewModel.password, secondPW: signUpViewModel.passwordVerify)){
                            
                            signUpViewModel.signUp(username: signUpViewModel.username, password: signUpViewModel.password, completion: { response in
                                signUpViewModel.responseMessage = response ? SignUpStates.SUCCESSFUL : SignUpStates.SIGNUPFAILED
                            })
                        }else{
                            signUpViewModel.responseMessage = SignUpStates.PASSWORDFAILED
                        }
                    }){
                        CustomButton(buttonText: "Sign Up", buttonColor: .blue)
                    }
                }
            }else{
                NavigationLink("toHomeView", destination: HomeView(),
                               isActive: $signUpViewModel.navigateToHome)
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
