//
//  BlogPostResponse.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 28.01.21.
//
import Foundation

// MARK: - BlogPostResponse
struct BlogPostResponse: Codable {
    let accessToken: String
    let data: BlogPosts
}

// MARK: - BlogPosts
struct BlogPosts: Codable {
    let blog: [Blog]
}

// MARK: - Blog
struct Blog: Codable, Hashable {
    
    let title: String
    let cover: String
    let category, blogDescription: String
    let contentPictures: [String]
    let shareLink: String
    let contentVideo: String

    enum CodingKeys: String, CodingKey {
        case title, cover, category
        case blogDescription = "description"
        case contentPictures, shareLink, contentVideo
    }
}
