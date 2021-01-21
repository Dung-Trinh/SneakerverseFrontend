//
//  StartChatResponse.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 21.01.21.
//

import Foundation

// MARK: - Welcome
struct StartChatResponse: Codable {
    let accessToken: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: String
}
