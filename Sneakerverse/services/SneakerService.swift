//
//  SneakerService.swift
//  Sneakerverse
//
//  Created by Dung  on 26.11.20.
//

import Foundation
import KeychainAccess
import Alamofire

class SneakerService {
    let headers: HTTPHeaders
    let accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    
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
                    "condition": "\(sneakerOffer.condition)"
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
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
        let jsonDecoder = JSONDecoder()
        
        AF.request(API.OFFER, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var statusCode: Int?
            var offerResponse :SneakerDealsResponse
            statusCode = response.response?.statusCode
            
            switch statusCode {
            case 200:
                if response.data != nil{
                    offerResponse = try! jsonDecoder.decode(SneakerDealsResponse.self, from: response.data!)
                    completion(.success(offerResponse.data.offerlist))
                }
            case .none, .some(_):
                completion(.failure(.sendingOfferError))
            }
        }
    }
}
