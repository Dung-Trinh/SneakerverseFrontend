//
//  ProfileResponse.swift
//  Sneakerverse
//
//  Created by Dung  on 10.01.21.
//


import Foundation
import SwiftUI

// MARK: - ProfileResponse
struct ProfileResponse: Codable {
    let accessToken: String
    let data: ProfileData
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
    let ratings: [String]
    let id, username, password: String
    let sessionToken, registered: String

    enum CodingKeys: String, CodingKey {
        case role = "_role"
        case offers = "_offers"
        case favorites = "_favorites"
        case ratings = "_ratings"
        case id = "_id"
        case username = "_username"
        case password = "_password"
        case sessionToken = "_sessionToken"
        case registered = "_registered"
    }
}

struct UserProfileViewData{
    let username: String
    let registerDate: String
    let city: String
    let image: UIImage?
}

// MARK: - RatingResponse
struct RatingResponse: Codable {
    let accessToken: String
    let data: RangingArray
}

// MARK: - DataClass
struct RangingArray: Codable {
    let ratings: [Rating]
}

// MARK: - Rating
struct Rating: Codable, Identifiable {
    let id, targetUsername: String
    let rating: Int
    let evaluatorName, created: String
    let message: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case targetUsername = "_targetUsername"
        case rating = "_rating"
        case evaluatorName = "_evaluatorName"
        case created = "_created"
        case message = "_message"
    }
}
