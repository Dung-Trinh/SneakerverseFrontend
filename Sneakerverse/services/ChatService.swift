//
//  ChatService.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import Foundation
import Alamofire
import KeychainAccess

class ChatService{
    var headers: HTTPHeaders
    var accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    
    init(){
        headers = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
        
    }
    
    func fetchChatByChatId(chatId: String, completion: @escaping (Result<[ChatMessage], ChatServiceError>) -> Void){
        AF.request(API.HOST_URL+"/chat", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var chatListResponse: ChatListResponse?
            let jsonDecoder = JSONDecoder()
            let statusCode = response.response?.statusCode

            switch statusCode {
            case 200:
                if response.data != nil{
                    chatListResponse = try? jsonDecoder.decode(ChatListResponse.self, from: response.data!)
                    
                    for currentChat in chatListResponse!.data.chatList{
                        if currentChat.id == chatId{
                            completion(.success(currentChat.messages))
                        }
                    }
                    completion(.failure(.chatNotFound))
                }

            case .none, .some(_):
                completion(.failure(.chatServiceError))
            }
        }
    }

    func fetchAllChats(completion: @escaping (Result<[ChatList], ChatServiceError>) -> Void){
        AF.request(API.HOST_URL+"/chat", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var chatListResponse: ChatListResponse?
            let jsonDecoder = JSONDecoder()
            let statusCode = response.response?.statusCode

            switch statusCode {
            case 200:
                if response.data != nil{
                    chatListResponse = try? jsonDecoder.decode(ChatListResponse.self, from: response.data!)
                    
                   
                    completion(.success(chatListResponse!.data.chatList))
                }

            case .none, .some(_):
                completion(.failure(.chatServiceError))
            }
        }
    }
}
