//
//  ProfileResponse.swift
//  Sneakerverse
//
//  Created by Dung  on 10.01.21.
//


import Foundation
// MARK: - ProfileResponse
struct ProfileResponse: Codable {
    let accessToken: String
    let profileData: ProfileData
}

// MARK: - ProfileData
struct ProfileData: Codable {
    let userProfile: UserProfileDetails
}

// MARK: - UserProfile
struct UserProfileDetails: Codable {
    let role: String
    let offers: [String]
    let favorites: [String]
    let chats, ratings: [String]
    let id, username, password: String
    let v: Int
    let sessionToken, registered: String

    enum CodingKeys: String, CodingKey {
        case role = "_role"
        case offers = "_offers"
        case favorites = "_favorites"
        case chats = "_chats"
        case ratings = "_ratings"
        case id = "_id"
        case username = "_username"
        case password = "_password"
        case v = "__v"
        case sessionToken = "_sessionToken"
        case registered = "_registered"
    }
}
