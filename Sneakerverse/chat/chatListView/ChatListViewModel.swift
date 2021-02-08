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
                self.addWebsocketListener()
            case .failure:
                completion([])
            }
        })
    }
    
    func setChatService(chatService: ChatService){
        self.chatService = chatService
    }
    
    func getUsername(subscribers: [String]) -> String{
        if (subscribers.filter{$0 != self.username }.count == 0){
            return ""
        }
        
        return subscribers.filter{$0 != self.username }[0]
    }
    
    func addWebsocketListener(){
        var chatIDs: [String] = []
        for i in currentChatList{
            chatIDs.append(i.id)
        }
        
        self.chatService?.socketManager.updateChatList(chatID: chatIDs, setChatList: self.setChatlist)
    }
    
    func setChatlist(newChatList: [ChatList]) -> Void{
        self.currentChatList = newChatList
    }
    
}
