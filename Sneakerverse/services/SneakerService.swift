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
    let urlString = "http://localhost:3000"
    var accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    
    
    func sendSneakerOfferRequest(sneakerOffer: SneakerOffer, completion: @escaping (_ userResponse: Response?)->()){
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
        
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
        
        
        AF.request(urlString+"/offer", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var statusCode: Int?
            var userResponse: Response?
            
            statusCode = response.response?.statusCode
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                    userResponse = Response(json: json,statusCode: statusCode!)
                    
                }
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            
            completion(userResponse)
            
        }
        
    }
    
}
