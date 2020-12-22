//
//  UserService.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 21.11.20.
//

import Foundation
import KeychainAccess
import Alamofire

class UserService {
    let headers: HTTPHeaders = [
        .accept("application/json")
    ]
    
    func sendLoginRequest(username:String, password:String, completion: @escaping (Result<Bool,NetworkError>)->Void){
        let parameters = [
            "user":
                [
                    "username":"\(username)",
                    "password": "\(password)"
                ]
        ]
        
        AF.request(API.LOGIN, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var statusCode: Int?
            var userResponse: Response?
            
            statusCode = response.response?.statusCode
            switch statusCode {
            case 200:
                do {
                    if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: Any] {
                        userResponse = Response(json: json,statusCode: statusCode!)
                        
                        let keychain = Keychain(service: "sneakerverse.Sneakerverse")
                        keychain["accessToken"] = userResponse?.accessToken ?? ""
                        completion(.success(true))
                    }
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    completion(.failure(.decodingError))
                    return
                }
            case 404:
                completion(.failure(.userNotFound))
            case .none, .some(_):
                completion(.failure(.loginError))
            }
        }
    }
    
    func sendSignUpRequest(username:String, password:String, completion: @escaping (Result<Bool,NetworkError>)->Void) {
        let parameters = [
            "user":
                [
                    "username":"\(username)",
                    "password": "\(password)"
                ]
        ]
        
        AF.request(API.REGISTER, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            
            switch statusCode {
            case 200:
                completion(.success(true))
            case .none, .some(_):
                completion(.failure(.badRequest))
            }
        }
    }
}
