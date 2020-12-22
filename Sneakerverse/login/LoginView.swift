//
//  LoginView.swift
//  Sneakerverse
//
//  Created by Dung  on 19.11.20.
//

import SwiftUI

enum LoginStates: String {
    case DEFAULT = ""
    case LOGINFAILED = "Login failed"
    case SECCESSFUL = "Login successfull"
}

struct LoginView: View {
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                if(!loginViewModel.successfulAuth){
                    Title(text: "Sneaker Market")
                    
                    CustomTextField(storedText: $loginViewModel.username, placholderText: "Username",type: .TEXT,icon: Image(systemName: "person.fill"))
                    CustomTextField(storedText: $loginViewModel.password, placholderText: "Password", type: .PASSWORD)
                    
                    ResponseMessage(message: $loginViewModel.loginMessage)
                    
                    Button(action: {
                        loginViewModel.login(username: loginViewModel.username, password: loginViewModel.password){ success in
                            self.loginViewModel.successfulAuth = success
                            loginViewModel.loginMessage = self.loginViewModel.successfulAuth ? LoginStates.SECCESSFUL:LoginStates.LOGINFAILED
                        }
                    }) {
                        CustomButton(buttonText: "Login", buttonColor: .blue)
                    }
                }else{
                    HomeView()
                }
            }
            .padding()
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
