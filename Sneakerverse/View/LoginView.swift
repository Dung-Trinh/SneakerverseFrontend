//
//  LoginView.swift
//  Sneakerverse
//
//  Created by Dung  on 19.11.20.
//

import SwiftUI

enum TextType{
    case USERNAME, PASSWORD
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
                LoginTitle()
                
                LoginTextField(storedText: $username, placholderText: "Username",type: .USERNAME)
                LoginTextField(storedText: $password, placholderText: "Password", type: .PASSWORD)
               
                LoginMessage(message: $loginMessage)

                Button(action: {
                    let successfulLogin = viewModel.login(username: username, password: password)
                    loginMessage = successfulLogin ? LoginStates.SECCESSFUL:LoginStates.LOGINFAILED
                }) {
                        LoginButton(buttonText: "Login", buttonColour: .blue)
                }
                
                LabelledDivider(label: "or")
                
                Button(action: {
                }) {
                    LoginButton(buttonText: "Sign up", buttonColour: .black)
                }
                
                Button(action: {
                    self.successfulAuth = viewModel.authorization()
                }) {
                    if(successfulAuth){
                        LoginButton(buttonText: "Authorization Test", buttonColour: .green)
                    }else{
                        LoginButton(buttonText: "Authorization Test", buttonColour: .black)
                    }
                        
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

struct LoginButton: View {
    var buttonText: String
    var buttonColour: Color
    
    var body: some View {
        Text(buttonText)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(buttonColour)
            .cornerRadius(35.0)
    }
}

struct LoginTextField: View {
    
    @Binding var storedText: String
    
    var placholderText: String
    var type: TextType
    
    var body: some View {
        if(type == .USERNAME){
            HStack(spacing:15){
                Image(systemName: "person.fill")
                    .foregroundColor(.blue)
                    .opacity(0.8)
                
                TextField(placholderText, text: $storedText)
                    
            }
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        }else if (type == .PASSWORD){
            HStack(spacing:15){
                Image(systemName: "key.fill")
                    .foregroundColor(.blue)
                    .opacity(0.8)
                
                SecureField(placholderText, text: $storedText)
            }
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        }
        
    }
}

struct LoginMessage: View {
    @Binding var message: LoginStates
        
    var body: some View {
        var textColor: Color
        
        switch message {
        case .LOGINFAILED:
            textColor = .red
        case .SECCESSFUL:
            textColor = .green
        case .DEFAULT:
            textColor = .black
        }
        
        return Text(message.rawValue)
            .offset(y: -10)
            .animation(Animation.easeIn)
            .foregroundColor(textColor)
    }
}

struct LoginTitle: View {
    var body: some View {
        Text("SNEAKER MARKET")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 60)
    }
}

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat

    init(label: String, horizontalPadding: CGFloat = 20) {
        self.label = label
        self.horizontalPadding = horizontalPadding
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(Color.gray)
            line
        }
    }

    var line: some View {
        VStack {
            Divider().background(Color.gray)
        }
        .padding(horizontalPadding)
    }
}
