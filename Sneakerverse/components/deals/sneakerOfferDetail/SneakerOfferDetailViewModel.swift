//
//  SneakerOfferDetailViewModel.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 07.01.21.
//

import Foundation
import KeychainAccess

class SneakerOfferDetailViewModel: ObservableObject{
    var chatService: ChatService?
    var profileService = ProfileService()
    var myUserName = Keychain(service: "sneakerverse.Sneakerverse")["username"]!
    @Published var jumpToChat: Bool = false
    @Published var chatID: String = ""
    
    func chatWithOwner(ownerName:String ,ownerID: String) {
        if(myUserName != ownerName){
            chatService!.checkIfUserAlreadyHasChat(subscriberName: ownerName, completion: { response in
                switch response {
                case .success(let chatID):
                    self.chatID = chatID
                    self.jumpToChat = true
                case .failure:
                    self.startChatWithOwner( ownerID: ownerID)
                }
            })
        }else{
            print("Chat mit sich selbst ist nicht möglich")
        }
    }
    
    func startChatWithOwner(ownerID: String) {
        chatService!.startChatByID(subscriberID: ownerID, completion: { response in
            switch response {
            case .success(let subscriberID):
                self.chatID = subscriberID
                self.jumpToChat = true
            case .failure:
                print("start Chat with Owner failed")
            }
        })
    }
    
    func setChatService(chatService: ChatService){
        self.chatService = chatService
    }
}
