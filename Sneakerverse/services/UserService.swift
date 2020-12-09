//
//  UserService.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 21.11.20.
//

import Foundation
import KeychainAccess
import Alamofire

class UserService{
    let urlString = "http://localhost:3000"
    
    func sendLoginRequest(username:String, password:String, completion: @escaping (_ userResponse: Response?)->()){
        let headers: HTTPHeaders = [
            .accept("application/json")
        ]
        
        let parameters = [
            "user":
                [
                    "username":"\(username)",
                    "password": "\(password)"
                ]
        ]
        
        AF.request(urlString+"/user/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var statusCode: Int?
            var userResponse: Response?
            
            statusCode = response.response?.statusCode
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                    userResponse = Response(json: json,statusCode: statusCode!)
                    
                    let keychain = Keychain(service: "sneakerverse.Sneakerverse")
                    keychain["accessToken"] = userResponse?.accessToken ?? ""
                }
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            
            completion(userResponse)

        }
        
    }
    
    func sendSignUpRequest(username:String, password:String, completion: @escaping (_ userResponse: Response?)->()) {
        let parameters = [
            "user":
                [
                    "username":"\(username)",
                    "password": "\(password)"
                ]
        ]
        
        let headers: HTTPHeaders = [
            .accept("application/json")
        ]
        
        AF.request(urlString+"/user/register", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var statusCode: Int?
            var userResponse: Response?
            
            statusCode = response.response?.statusCode
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                    userResponse = Response(json: json,statusCode: statusCode!)
                    
                    let keychain = Keychain(service: "sneakerverse.Sneakerverse")
                    keychain["accessToken"] = userResponse?.accessToken ?? ""
                }
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            
            completion(userResponse)

        }
        
    }
}
