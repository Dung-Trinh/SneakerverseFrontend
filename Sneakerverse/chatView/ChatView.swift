//
//  ChatView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import SwiftUI

struct ChatView: View {
    @State var allMessages: [ChatMessage]
    
    @StateObject var chatViewModel = ChatViewModel()
    
    let testMessage = UserMessage (content: "Hello Sneakerlover", user: UserProfile(name: "Dung", avatar: Image(systemName: "person.circle.fill"), isCurrentUser: false))
    
    let testMessage2 = UserMessage (content: "Hey buddy", user: UserProfile(name: "Tim", avatar: Image(systemName: "person.icloud.fill"), isCurrentUser: true))
    
    var body: some View {
        VStack(){
            List{
                ForEach(allMessages){ message in
                    UserMessageView(currentMessage: UserMessage (content: message.message, user: UserProfile(name: "Dung", avatar: Image(systemName: "person.circle.fill"), isCurrentUser: false)))
                }
            }
            
            HStack(){
                CustomTextField(storedText: $chatViewModel.userInput, placholderText: "text...", type: .TEXT)
                
                Button(action:{
                }){
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 40 , height: 40)
                }
                
                
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(allMessages: [])
    }
}
