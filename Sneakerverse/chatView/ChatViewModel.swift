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
    
    func sendMessage(message: String, completion: @escaping ()->Void){
        chatService.sendMessage(message: message, completion: {response in
            print("statuscode \(response)")
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


