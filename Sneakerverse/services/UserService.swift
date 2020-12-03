//
//  UserService.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 21.11.20.
//

import Foundation
import KeychainAccess
import Alamofire
import PromiseKit
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
        
        AF.request("http://localhost:3000/users/login", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var statusCode: Int?
            var userResponse: Response?
            
            statusCode = response.response?.statusCode
            do {
                //create json object from data
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
    
//    func sendLoginRequest(username:String, password:String, completion: @escaping (_ userResponse: Response?)->()) {
//        let parameters = [
//            "user":
//                [
//                    "username":"\(username)",
//                    "password": "\(password)"
//                ]
//        ]
//        print(parameters)
//
//        //create the url with URL
//        let url = URL(string: "http://localhost:3000/users/login")! //change the url
//
//        //create the session object
//        let session = URLSession.shared
//
//        //now create the URLRequest object using the url object
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST" //set http method as POST
//
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: []) // pass dictionary to nsdata object and set it as request body
//        } catch _ {
//            print("LOGIN REQUEST ERROR")
//        }
//
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//
//        //create dataTask using the session object to send data to the server
//        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
//            var statusCode: Int?
//            var userResponse: Response?
//
//            if let response = response as? HTTPURLResponse {
//                statusCode = response.statusCode
//                print("statusCode: \(response.statusCode)")
//            }
//            guard error == nil else {
//                return
//            }
//
//            guard let data = data else {
//                return
//            }
//
//            do {
//                //create json object from data
//                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                    userResponse = Response(json: json,statusCode: statusCode!)
//
//                    let keychain = Keychain(service: "sneakerverse.Sneakerverse")
//                    keychain["accessToken"] = userResponse?.accessToken ?? ""
//                    // handle json...
//                }
//            } catch _ {
//                print("LOGIN REQUEST ERROR")
//            }
//            completion(userResponse)
//        })
//
//        task.resume()
//    }
    
    
    func sendSignUpRequest(username:String, password:String, completion: @escaping (_ userResponse: Response?)->()) {
        let parameters = [
            "user":
                [
                    "username":"\(username)",
                    "password": "\(password)"
                ]
        ]
        print(parameters)
        
        
        //create the url with URL
        let url = URL(string: "http://localhost:3000/users/register")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: []) // pass dictionary to nsdata object and set it as request body
        } catch _ {
            print("LOGIN REQUEST ERROR")
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            var statusCode: Int?
            var userResponse: Response?
            
            if let response = response as? HTTPURLResponse {
                statusCode = response.statusCode
                print("statusCode: \(response.statusCode)")
            }
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    userResponse = Response(json: json,statusCode: statusCode!)
                    
                    let keychain = Keychain(service: "sneakerverse.Sneakerverse")
                    keychain["accessToken"] = userResponse?.accessToken ?? ""
                    // handle json...
                }
            } catch _ {
                print("REGISTER REQUEST ERROR")
            }
            completion(userResponse)
        })
        
        task.resume()
    }
}
