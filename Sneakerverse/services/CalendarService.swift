//
//  CalendarService.swift
//  Sneakerverse
//
//  Created by Dung  on 27.01.21.
//

import Foundation
import KeychainAccess
import Alamofire

class CalendarService{
    let headers: HTTPHeaders
    let accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    let jsonDecoder = JSONDecoder()
    
    init() {
        headers = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
    }
    
    func fetchCalendarItems(completion: @escaping (Result<[SneakerCalendarItem],CalendarError>)->Void){
        AF.request(API.GET_CALENDAR_RELEASES, method: .get,  encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            var calendarResponse: CalendarResponse
            
            switch statusCode {
            case 200:
                calendarResponse = try! self.jsonDecoder.decode(CalendarResponse.self, from: response.data!)
                completion(.success(calendarResponse.data.releaseCalendar))
            case .none, .some(_):
                completion(.failure(.calendarError))
            }
        }
    }
}
