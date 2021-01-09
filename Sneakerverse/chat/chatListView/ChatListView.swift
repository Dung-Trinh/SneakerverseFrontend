//
//  ChatListView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import SwiftUI

struct ChatListView: View {
    @EnvironmentObject var chatService: ChatService
    @StateObject var chatListViewModel = ChatListViewModel()
    
    var body: some View {
            List{
                ForEach(chatListViewModel.currentChatList){ chat in
                    NavigationLink(
                        destination: ChatView(chatID: chat.id)){
                        ChatRow(username: chatListViewModel.getUsername(subscribers: chat.subscriber), lastMessages: chat.messages)
                    }
                }
            }
            .navigationBarTitle("Chats")
            .onAppear {
                chatListViewModel.setChatService(chatService: self.chatService)
                chatListViewModel.getAllChats(completion: {_ in })
            }
        
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
