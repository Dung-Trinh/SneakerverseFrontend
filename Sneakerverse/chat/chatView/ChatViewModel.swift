//
//  ChatViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import Foundation
import KeychainAccess

class ChatViewModel: ObservableObject {
    @Published var userInput: String = ""
    @Published var allMessages: [ChatMessage] = []
    
    var chatService: ChatService?
    let username = Keychain(service: "sneakerverse.Sneakerverse")["username"]!

    func setup(chatService: ChatService, chatID: String ){
        self.chatService = chatService
        
    }
    
    func sendMessage(chatID: String, completion: @escaping (Bool) -> Void){
        chatService!.sendMessage(chatID: chatID ,message: userInput, completion: { response in
            switch response{
            case .success:
                completion(true)
            case .failure:
                completion(false)
            }
        })
    }
    
    func setChatService(chatService: ChatService){
        self.chatService = chatService
    }
    
    func updateChat(chatID: String){
        chatService?.socketManager.updateChat(chatID:chatID, setAllMessages: setAllMessages)
    }
    
    func setChat(chatID: String){
        chatService!.fetchChatByChatId(chatId: chatID, completion: {response in
            switch response{
            case .success(let chatMessages):
                self.allMessages = chatMessages
            case .failure: break
            
            }
            
        })
    }
    
    func setAllMessages(newMessages: [ChatMessage]){
        self.allMessages = newMessages
    }
}
