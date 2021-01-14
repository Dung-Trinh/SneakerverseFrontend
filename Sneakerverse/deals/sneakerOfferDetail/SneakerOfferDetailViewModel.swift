//
//  SneakerOfferDetailViewModel.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 07.01.21.
//

import Foundation

class SneakerOfferDetailViewModel: ObservableObject{
    let chatService = ChatService();
    @Published var jumpToChat: Bool = false
    @Published var chatID: String = ""
    
    func startChatWithOwner(ownerID: String, completion: @escaping (Bool) -> Void) {
        chatService.startChatByID(subscriberID: ownerID, completion: { response in
            switch response {
            case .success:
                completion(true)
            case .failure:
                print("start Chat with Owner failed")
                completion(false)
            }
        })
    }
}
