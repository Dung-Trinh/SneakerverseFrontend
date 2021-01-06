//
//  ChatView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import SwiftUI
import KeychainAccess

struct ChatView: View {
    @EnvironmentObject var chatService: ChatService
    @StateObject var chatViewModel = ChatViewModel()
    let chatID: String
    
    var body: some View {
        VStack(){
            List{
                ForEach(chatViewModel.allMessages){ message in
                    UserMessageView(currentMessage: UserMessage (content: message.message, user: UserProfile(name: "Dung", avatar: Image(systemName: "person.circle.fill"), isCurrentUser: message.senderName == chatViewModel.username ? true : false),time: message.created))
                }
            }
            
            HStack(){
                CustomTextField(storedText: $chatViewModel.userInput, placholderText: "text...", type: .TEXT)
                
                Button(action:{
                    chatViewModel.sendMessage(completion: { response in
                        if response{
                            chatViewModel.userInput = ""
                        }
                    })
                }){
                    Image(systemName: "paperplane.circle.fill")
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .frame(width: 40 , height: 40)
                }
            }
        }.onAppear{
            chatViewModel.setChatService(chatService: chatService)
            chatViewModel.setChat(chatID: chatID)
            chatViewModel.setChatService(chatService: self.chatService)
            chatViewModel.updateChat()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatID: "")
    }
}
