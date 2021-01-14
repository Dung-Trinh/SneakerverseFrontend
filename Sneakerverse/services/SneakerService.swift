//
//  SneakerService.swift
//  Sneakerverse
//
//  Created by Dung  on 26.11.20.
//

import Foundation
import KeychainAccess
import Alamofire

// MARK: - LocationAPIResponse
struct LocationAPIResponse: Codable {
    let data: [CityLocation]
}

// MARK: - Datum
struct CityLocation: Codable {
    let latitude, longitude: Double
    let name, country, label: String
}

class SneakerService {
    let headers: HTTPHeaders
    let accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    let jsonDecoder = JSONDecoder()

    init() {
        headers = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
    }
    
    func sendSneakerOfferRequest(sneakerOffer: SneakerOffer, completion: @escaping (Result<Bool,SneakerServiceError>)->Void){
        let parameters = [
            "offer":
                [
                    "name":"\(sneakerOffer.sneakerName)",
                    "description": "\(sneakerOffer.description)",
                    "size": "\(sneakerOffer.size)",
                    "brand": "\(sneakerOffer.brand)",
                    "price": "\(sneakerOffer.price)",
                    "condition": "\(sneakerOffer.condition)",
                    "city":[
                        "latitude": "\(sneakerOffer.city.latitude)",
                        "longitude": "\(sneakerOffer.city.longitude)",
                        "cityName": "\(sneakerOffer.city.cityName)"
                    ]
                ]
        ]
        
        AF.request(API.OFFER, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            
            switch statusCode {
            case 200:
                completion(.success(true))
            case .none, .some(_):
                completion(.failure(.sendingOfferError))
            }
        }
    }
    
    func getAllSneakerOffers(completion:@escaping(Result<[Offer],SneakerServiceError>)->Void){
        AF.request(API.OFFER, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var statusCode: Int?
            var offerResponse :SneakerDealsResponse
            statusCode = response.response?.statusCode
            
            switch statusCode {
            case 200:
                if response.data != nil{
                    offerResponse = try! self.jsonDecoder.decode(SneakerDealsResponse.self, from: response.data!)
                    completion(.success(offerResponse.data.offerlist))
                }
            case .none, .some(_):
                completion(.failure(.sendingOfferError))
            }
        }
    }
    
    func getCityLocation(city: String, completion:@escaping(Result<City,SneakerServiceError>)->Void){
        AF.request(API.MAPS_API_URL + city, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            var locationResponse: LocationAPIResponse?
            
            switch statusCode {
            case 200:
                if response.data != nil{
                    locationResponse = try! self.jsonDecoder.decode(LocationAPIResponse.self, from: response.data!)
                    let cityData = City(id: "", latitude: (locationResponse?.data[0].latitude)!, longitude: (locationResponse?.data[0].longitude)!, cityName: city)
                    completion(.success(cityData))
                }
            case .none, .some(_):
                completion(.failure(.sendingOfferError))
            }
        }
    }
}
