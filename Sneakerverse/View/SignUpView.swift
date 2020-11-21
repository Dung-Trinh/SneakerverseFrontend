//
//  SignUpView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 19.11.20.
//

import SwiftUI

struct SignUpView: View {
    @State var username: String = "TestUser"
    @State var password: String = "TestPassword"
    //@State var passwordsAreNotTheSame: Bool
    @State var viewModel: SignUpViewModel = SignUpViewModel()
    var body: some View {
        NavigationView{
            VStack {
                Title(text:"Registrieren")
                CustomTextField(storedText: $username, placholderText: "Username", type: .USERNAME)
                CustomTextField(storedText: $password, placholderText: "Password", type: .PASSWORD)
                CustomTextField(storedText: $password, placholderText: "Password", type: .PASSWORD)
               // ResponseMessage(message: <#T##Binding<LoginStates>#>)
                Button(action: {
            //        self.successfulSignUp = viewModel.signUp()
                }, label: {
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                })
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
