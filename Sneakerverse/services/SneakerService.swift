//
//  SneakerService.swift
//  Sneakerverse
//
//  Created by Dung  on 26.11.20.
//

import Foundation
import KeychainAccess
class SneakerService {
    //TODO: — passing token
    var accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    
    func sendSneakerOfferRequest(sneakerOffer: SneakerOffer, completion: @escaping (_ response: Response?)->()) {
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
        
        //create the url with URL
        let url = URL(string: "http://localhost:3000/offer")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: []) // pass dictionary to nsdata object and set it as request body
        } catch _ {
            print("OFFER SNEAKER REQUEST ERROR")
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("bearer \(self.accessToken )", forHTTPHeaderField: "Authorization")
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            var statusCode: Int?
            var userResponse: Response?
            
            if let response = response as? HTTPURLResponse {
                statusCode = response.statusCode
                print("statusCode: \(response.statusCode)")
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    userResponse = Response(json: json,statusCode: statusCode!)
                    
                    // handle json...
                }
            } catch _ {
                print("SNEAKER OFFER REQUEST ERROR")
            }
            completion(userResponse)
        })
        
        task.resume()
    }
}
