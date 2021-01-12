//
//  ChatListViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import Foundation
import KeychainAccess

class ChatListViewModel: ObservableObject{
    @Published var currentChatList: [ChatList] = []
    var chatService: ChatService?
    let username = Keychain(service: "sneakerverse.Sneakerverse")["username"]!
  
    func getAllChats( completion: @escaping ([ChatList]) -> Void){
        chatService!.fetchAllChats(completion: { response in
            switch response{
            case .success(let chatList):
                self.currentChatList = chatList
                completion(chatList)
            case .failure:
                completion([])
            }
            
        })
    }
    
    func setChatService(chatService: ChatService){
        self.chatService = chatService
    }
    
    func getUsername(subscribers: [String]) -> String{
        return subscribers.filter{$0 != self.username }[0]
    }
}
