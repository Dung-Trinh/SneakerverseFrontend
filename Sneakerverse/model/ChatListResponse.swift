//
//  ChatListResponse.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import Foundation

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
struct ChatList: Codable, Identifiable {
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
struct ChatMessage: Codable, Identifiable,Hashable {
    let id, senderName, message, chatID: String
    let created: String?
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case senderName = "_senderName"
        case message = "_message"
        case chatID = "_chatId"
        case v = "__v"
        case created = "_created"
    }
}
