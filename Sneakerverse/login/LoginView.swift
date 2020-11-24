//
//  LoginView.swift
//  Sneakerverse
//
//  Created by Dung  on 19.11.20.
//

import SwiftUI

enum TextFieldType{
    case TEXT, PASSWORD, NUMBERS
}

enum LoginStates: String{
    case DEFAULT = ""
    case LOGINFAILED = "Login failed"
    case SECCESSFUL = "Login successfull"
}

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct LoginView: View {
    
    @State var username: String = "TestUser"
    @State var password: String = "TestPassword"
    
    @State var loginMessage: LoginStates = LoginStates.DEFAULT
    @State var successfulAuth: Bool = false
    
    @State var viewModel: LoginViewModel = LoginViewModel()
    var body: some View {
            ZStack {
                VStack {
                    Title(text: "Sneaker Market")
                    
                    CustomTextField(storedText: $username, placholderText: "Username",type: .TEXT,icon: Image(systemName:"person.fill"))
                    CustomTextField(storedText: $password, placholderText: "Password", type: .PASSWORD)
                    
                    ResponseMessage(message: $loginMessage)
                    
                    Button(action: {
                        let successfulLogin = viewModel.login(username: username, password: password)
                        loginMessage = successfulLogin ? LoginStates.SECCESSFUL:LoginStates.LOGINFAILED
                        self.successfulAuth = successfulLogin
                        print(successfulLogin)
                    }) {
                        CustomButton(buttonText: "Login", buttonColour: .blue)
                    }
                    
                    NavigationLink(destination: HomeView(), isActive: $successfulAuth){}
                    
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
