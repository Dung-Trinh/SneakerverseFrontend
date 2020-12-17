//
//  LoginResponse.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 22.11.20.
//

import Foundation

struct Response: Codable{
    var data: String
    var accessToken: String
    var errorDescription: String
    var statusCode: Int
    
    init(json: [String: Any], statusCode:Int = 0) {
        self.accessToken = json["accessToken"] as? String ?? ""
        self.data = json["data"] as? String ?? ""
        self.errorDescription = json["errorDescription"] as? String ?? ""
        self.statusCode = statusCode
    }
}

// MARK: - ChatListResponse
struct ChatListResponse: Codable {
    let accessToken: String
    let data: ChatData
}

// MARK: - DataClass
struct ChatData: Codable {
    let chatList: [ChatList]
}

// MARK: - ChatList
struct ChatList: Codable {
    let messages: [ChatMessage]
    let subscriber: [String]
    let id: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case messages = "_messages"
        case subscriber = "_subscriber"
        case id = "_id"
        case v = "__v"
    }
}

// MARK: - Message
struct ChatMessage: Codable {
    let id, senderName, message, chatID: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case senderName = "_senderName"
        case message = "_message"
        case chatID = "_chatId"
        case v = "__v"
    }
}
