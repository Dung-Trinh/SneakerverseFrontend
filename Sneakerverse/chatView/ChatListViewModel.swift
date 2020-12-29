//
//  ChatListViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import Foundation

class ChatListViewModel: ObservableObject{
    let chatService = ChatService()
    @Published var currentChatList: [ChatList] = []
    
    func getAllChats( completion: @escaping ([ChatList]) -> Void){
        chatService.fetchAllChats(completion: { response in
            switch response{
            case .success(let chatList):
                self.currentChatList = chatList
                completion(chatList)
            case .failure:
                completion([])
            }
            
        })
    }
}
