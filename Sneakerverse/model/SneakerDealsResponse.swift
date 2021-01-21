//
//  SneakerDealsResponse.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 06.01.21.
//

import Foundation

// MARK: - Welcome
struct SneakerDealsResponse: Codable {
    let accessToken: String
    let data: offerListData
}

// MARK: - DataClass
struct offerListData: Codable {
    let offerlist: [Offer]
}

// MARK: - Offer
struct Offer: Codable,Identifiable {
    let id, name, offerDescription: String
    let price: Double
    let size: Double
    let brand, condition, ownerName, ownerID: String
    let city: City
    let created: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "_name"
        case offerDescription = "_description"
        case price = "_price"
        case size = "_size"
        case brand = "_brand"
        case condition = "_condition"
        case ownerName = "_ownerName"
        case ownerID = "_ownerId"
        case city = "_city"
        case created = "_created"
        case v = "__v"
    }
}

// MARK: - City
struct City: Codable {
    let id: String
    let latitude: Double
    let longitude: Double
    let cityName: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case latitude = "_latitude"
        case longitude = "_longitude"
        case cityName = "_cityName"
        case v = "__v"
    }
}
