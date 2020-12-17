//
//  ChatViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 13.12.20.
//

import SwiftUI
import Combine
import Foundation

struct ChatViewModel{
    var chatService = ChatService()
    
    func sendMessage(message: String, completion: @escaping (_ statusCode:Int)->Void){
        chatService.sendMessage(message: message, completion: {response in
            completion(response)
        })
    }
    
    func getAllChats(completion:@escaping(_ response: [ChatList]?)->()){
        chatService.fetchAllChats(completion: {response in
            completion(response?.data.chatList)
        })
    }
    
}

struct ChatUser {
    var name: String
    var profileImage: String
    var isCurrentUser: Bool = false
}

struct Message {
    var content: String
    var user: ChatUser
}


