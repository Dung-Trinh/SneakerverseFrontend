//
//  ChatService.swift
//  Sneakerverse
//
//  Created by Dung  on 14.12.20.
//

import Foundation
import KeychainAccess
import Alamofire

class ChatService{
    var headers: HTTPHeaders
    var accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    
    init(){
        headers = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
        
    }

    func sendMessage(message: String, completion:@escaping(_ statusCode:Int)->()){
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
        
        let parameters = [
            "chatId":"5fd78adc346cd5eb94649174",
            "chatMessage":"\(message)"
        ]

        
        AF.request(API.CHAT_MESSAGE, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var statusCode: Int?
            
            statusCode = response.response?.statusCode
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                    print(json)
                }
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            
            completion(statusCode!)
            
        }
    }
    
    func fetchAllChats(completion:@escaping(_ userResponse: ChatListResponse?)->()){
        AF.request(API.HOST_URL+"/chat", method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var chatListResponse: ChatListResponse?
            let jsonDecoder = JSONDecoder()
            
            let statusCode = response.response?.statusCode
            print("statuscode\(statusCode)")
            if response.data != nil{
                
                chatListResponse = try? jsonDecoder.decode(ChatListResponse.self, from: response.data!)
            }
            completion(chatListResponse)
            
        }
    }
}

