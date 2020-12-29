//
//  ChatListView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import SwiftUI

struct ChatListView: View {
    @StateObject var chatListViewModel = ChatListViewModel()
    
    var body: some View {
            List{
                ForEach(chatListViewModel.currentChatList){ chat in
                    NavigationLink(
                        // TODO: Model mitgeben um chat anzuzeigen
                        destination: ChatView(allMessages: chat.messages)){
                        ChatRow(username: chat.id, lastMessage: "")
                    }
                }
            }
            .navigationBarTitle("Chats")
            .onAppear {
                chatListViewModel.getAllChats(completion: {_ in })
            }
        
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
