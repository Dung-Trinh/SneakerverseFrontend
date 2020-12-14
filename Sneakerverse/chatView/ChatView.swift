//
//  ChatView.swift
//  Sneakerverse
//
//  Created by Dung  on 13.12.20.
//

import SwiftUI

struct ChatView: View {
    let chatViewModel: ChatViewModel = ChatViewModel()
    @State var typingMessage: String = "Hey!"
    
    var body: some View {
        VStack(){
            ChatText(message: "hi", isCurrentUser: false)
            ChatText(message: "hi", isCurrentUser: true)

            HStack(){
                CustomTextField(storedText: $typingMessage, placholderText: "text...", type: .TEXT)
                Button(action:{
                    chatViewModel.sendMessage(message: typingMessage, completion: {
                        
                    })
                }){
                    CustomButton(buttonText: "send", buttonColor: .blue)
                        .frame(width: 300 , height: 60, alignment: .leading)
                }
                
                
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}


