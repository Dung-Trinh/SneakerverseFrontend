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
    let offerlist: [Offer]?
}

// MARK: - Offer
struct Offer: Codable,Identifiable {
    let id, name, offerDescription: String
    let price: Double
    let size: Double
    let brand, condition, ownerName, ownerID: String
    let city: City
    let created: String
    let img: [ImgElement]
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
        case img = "_img"
        case v = "__v"
    }
}

// MARK: - City
struct City: Codable {
    let id: String
    let latitude: Double
    let longitude: Double
    let cityName: String
//    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case latitude = "_latitude"
        case longitude = "_longitude"
        case cityName = "_cityName"
       // case v = "__v"
    }
}

// MARK: - ImgElement
struct ImgElement: Codable {
    let img: ImgImg
    let id, name, desc: String

    enum CodingKeys: String, CodingKey {
        case img = "_img"
        case id = "_id"
        case name = "_name"
        case desc = "_desc"
    }
}

// MARK: - ImgImg
struct ImgImg: Codable {
    let data: ImgData
    let contentType: String

    enum CodingKeys: String, CodingKey {
        case data = "_data"
        case contentType = "_contentType"
    }
}

// MARK: - ImgData
struct ImgData: Codable {
    let type: String
    let data: [Int]
}

struct OfferData: Codable {
    let offers: [Offer]?
}

struct SelectedDealsResponse: Codable {
    let accessToken: String
    let data: OfferData
}
