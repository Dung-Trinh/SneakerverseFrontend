//
//  ChatService.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import Foundation
import Alamofire
import KeychainAccess
import SocketIO
import SwiftyJSON

struct NewMessages: Codable{
    var messages: [ChatMessage]
}

class ChatService: ObservableObject{
    var headers: HTTPHeaders
    var accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    let socketManager = WebSocketManager()
    
    init(){
        headers = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
        
    }
    
    func startChatByID(subscriberID: String, completion:@escaping(Result<String, ChatServiceError>) -> Void){
        let parameters = [
            "subscriber":"\(subscriberID)"
        ]
        
        AF.request(API.CHAT, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var statusCode: Int?
            var startChatResponse: StartChatResponse?
            let jsonDecoder = JSONDecoder()
            
            
            statusCode = response.response?.statusCode
            
            switch statusCode {
            case 200:
                if response.data != nil{
                    startChatResponse = try?
                        jsonDecoder.decode(StartChatResponse.self, from: response.data!)
                    completion(.success(startChatResponse!.data.id))
                }
            case .none, .some(_):
                completion(.failure(.chatServiceError))
            }
        }
    }
    
    func fetchChatByChatId(chatId: String, completion: @escaping (Result<[ChatMessage], ChatServiceError>) -> Void){
        AF.request(API.CHAT, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
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
        AF.request(API.CHAT, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
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
    
    func checkIfUserAlreadyHasChat(subscriberName:String,completion: @escaping (Result<String, ChatServiceError>) -> Void){
        AF.request(API.CHAT, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var chatListResponse: ChatListResponse?
            let jsonDecoder = JSONDecoder()
            let statusCode = response.response?.statusCode
            
            switch statusCode {
            case 200:
                if response.data != nil{
                    chatListResponse = try? jsonDecoder.decode(ChatListResponse.self, from: response.data!)
                    for chat in chatListResponse!.data.chatList{
                        for ownerName in chat.subscriber{
                            if(subscriberName == ownerName){
                                completion(.success(chat.id))
                            }
                        }
                    }
                    completion(.failure(.chatServiceError))
                }
                
            case .none, .some(_):
                completion(.failure(.chatServiceError))
            }
        }
    }
    
    func sendMessage(chatID: String, message: String, completion:@escaping(Result<Bool, ChatServiceError>) -> Void){
        let parameters = [
            "chatId":"\(chatID)",
            "chatMessage":"\(message)"
        ]
        
        AF.request(API.CHAT_MESSAGE, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var statusCode: Int?
            
            statusCode = response.response?.statusCode
            
            switch statusCode {
            case 200:
                completion(.success(true))
            case .none, .some(_):
                completion(.failure(.chatServiceError))
            }
        }
    }
    
}

class WebSocketManager: ObservableObject{
    
    let manager = SocketManager(socketURL: URL(string: "ws://localhost:3000")!)
    let socket: SocketIOClient
    
    init(){
        socket = manager.defaultSocket
        socket.on(clientEvent: .connect) {data, ack in
            print("socket connected")
            self.socket.emit("join", "5fd78adc346cd5eb94649174")
        }
        
        //        socket.on("update5fd78adc346cd5eb94649174"){ data, ack in
        //        print(data)
        //        }
        
        socket.connect()
    }
    
    func updateChat(chatID: String,setAllMessages: @escaping (_ newMessages: [ChatMessage])-> Void){
        socket.on("update\(chatID)"){ data, ack in
            
            do {
                let json:JSON = JSON(data[0])
                let jsonData = Data(json.rawString()!.utf8)
                
                do {
                    let newMessages = try JSONDecoder().decode(NewMessages.self, from: jsonData)
                    setAllMessages(newMessages.messages)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
