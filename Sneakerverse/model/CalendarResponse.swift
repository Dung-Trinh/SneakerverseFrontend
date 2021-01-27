//
//  CalendarResponse.swift
//  Sneakerverse
//
//  Created by Dung  on 26.01.21.
//

import Foundation

// MARK: - CalendarResponse
struct CalendarResponse: Codable {
    let accessToken: String
    let data: ReleaseCalendar
}

// MARK: - ReleaseCalendar
struct ReleaseCalendar: Codable {
    let releaseCalendar: [SneakerCalendarItem]
}

// MARK: - SneakerCalendarItem
struct SneakerCalendarItem: Codable, Hashable {
    let title: String
    let imageURL: String
    let retailPrice, priceSpan, releaseDate: String
    let imgArray: [String]
    let brand, releaseCalendarDescription, position: String

    enum CodingKeys: String, CodingKey {
        case title, imageURL, retailPrice, priceSpan, releaseDate, imgArray, brand
        case releaseCalendarDescription = "description"
        case position
    }
}
 
