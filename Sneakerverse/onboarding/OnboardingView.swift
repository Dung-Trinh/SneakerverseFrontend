//
//  OnboardingView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 19.11.20.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        NavigationView{
            VStack {
                Title(text: "SNEAKERVERSE")
                
                OnboardingGallery()
                    .frame(width: .infinity, height: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                NavigationLink (destination: LoginView()){
                    CustomButton(buttonText: "Login", buttonColor: .black)
                }
                
                LabelledDivider(label: "or")
                
                NavigationLink(destination: SignUpView()){
                    CustomButton(buttonText: "Sign up", buttonColor: .blue)
                }
            }
        }.navigationBarHidden(true)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
