//
//  API.swift
//  Sneakerverse
//
//  Created by Dung  on 08.12.20.
//

import Foundation

struct API{
    static let HOST_URL = "http://localhost:3000"
    static let LOGIN = HOST_URL + "/user/login"
    static let REGISTER = HOST_URL + "/user/register"
    static let OFFER = HOST_URL + "/offer"
    static let SELECTED_OFFER = OFFER + "/selected"
    static let CHAT = HOST_URL + "/chat"
    static let CHAT_MESSAGE = CHAT + "/message"
    static let MAPS_API_KEY = "8abf68a5b2179b5bb56e874572bfc841"
    static let MAPS_API_URL = "http://api.positionstack.com/v1/forward?access_key=\(MAPS_API_KEY)&query="
    static let PROFILE = HOST_URL + "/profile"
    static let GET_PROFILE = PROFILE + "/get"
    static let GET_RATING_BY_ID = HOST_URL + "/rating/get"
    static let GET_CALENDAR_RELEASES = HOST_URL + "/releaseCalendar"
    static let SEND_RATING = HOST_URL + "/rating"
    static let LOGOUT = HOST_URL + "/user/logout"
    static let BLOGPOST = HOST_URL + "/blog"
}
