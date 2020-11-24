//
//  UI_Objects.swift
//  Portfolio_Sneaker
//
//  Created by Hoang Ha Vu on 19.11.20.
//

import SwiftUI

struct UI_Objects: View {
    @Binding var showState: LoginStates
    @Binding var exampleText: String
    var body: some View {
        VStack {
            Text("Title")
            Title(text: "SNEAKER MARKET")
            Group{
                CustomTextField(
                    storedText: $exampleText, placholderText: "Username", type:.TEXT, icon: Image(systemName: "person.fill"))
                CustomTextField(
                    storedText: $exampleText, placholderText: "Password", type:.PASSWORD)
                Text("Divider")
                LabelledDivider(label: "or")
            }
            Text("Buttons")
            Button(action: {
            }) {
                CustomButton(buttonText: "Example", buttonColour: .black)
            }
            Button(action: {
            }) {
                CustomButton(buttonText: "Sign up", buttonColour: .blue)
            }
            Text("Response Message")
            ResponseMessage(message: $showState)
        }
    }
}

struct UI_Objects_Previews: PreviewProvider {
    @State static var exampleStatus = LoginStates.LOGINFAILED
    @State static var exampleText = "Example Text"
    static var previews: some View {
        UI_Objects(showState: $exampleStatus, exampleText: $exampleText)
    }
}

struct CustomButton: View {
    var buttonText: String
    var buttonColour: Color
    
    var body: some View {
        Text(buttonText)
            .font(.subheadline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: .infinity)
            .background(buttonColour)
            .cornerRadius(35.0)
    }
}

struct Title: View {
    var text: String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct ResponseMessage: View {
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
            .animation(Animation.easeIn)
            .foregroundColor(textColor)
    }
}

struct ResponseSignUp: View {
    @Binding var message: SignUpStates
    
    var body: some View {
        var textColor: Color
        
        switch message {
        case .SIGNUPFAILED:
            textColor = .red
        case .SUCCESSFUL:
            textColor = .green
        case .DEFAULT:
            textColor = .black
        case .PASSWORDFAILED:
            textColor = .red
        }
        
        return Text(message.rawValue)
            .animation(Animation.easeIn)
            .foregroundColor(textColor)
    }
}

struct CustomTextField: View {
    
    @Binding var storedText: String
    
    var placholderText: String
    var type: TextFieldType
    var icon: Image?
    
    init(storedText:Binding<String>, placholderText:String, type: TextFieldType, icon: Image? = nil) {
        self._storedText = storedText
        self.type = type
        self.placholderText = placholderText
        if icon != nil {
            self.icon = icon
        }
    }
    
    var body: some View {
        HStack(spacing:15){
            if(type == .PASSWORD){
                Image(systemName: "key.fill")
                    .foregroundColor(.blue)
                    .opacity(0.8)
                SecureField(placholderText, text: $storedText)
            }else{
                if((icon) != nil){
                    self.icon
                        .foregroundColor(.blue)
                        .opacity(0.8)
                }
                
                TextField(placholderText, text: $storedText)
                    .if(type == .NUMBERS) {
                        $0.keyboardType(.decimalPad)
                    }
                
            }
        }
        .padding()
        .background(lightGreyColor)
        .cornerRadius(5.0)
        .padding(.bottom, 20)
        
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

extension View {
    @ViewBuilder
    public func `if`<V>(_ condition: Bool, input: (Self) -> V) -> some View where V: View {
        if condition {
            input(self)
        } else {
            self
        }
    }
}
