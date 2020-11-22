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
    
    init(json: [String: Any]) {
        self.accessToken = json["accessToken"] as? String ?? ""
        self.data = json["data"] as? String ?? ""
        self.errorDescription = json["errorDescription"] as? String ?? ""
    }
}
