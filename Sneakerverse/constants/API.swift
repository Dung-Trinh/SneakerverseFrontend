//
//  API.swift
//  Sneakerverse
//
//  Created by Dung  on 08.12.20.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case loginError
    case userNotFound
    case badRequest
}

struct API{
    static let HOST_URL = "http://localhost:3000"
    static let LOGIN = HOST_URL + "/user/login"
    static let REGISTER = HOST_URL + "/user/register"
}
