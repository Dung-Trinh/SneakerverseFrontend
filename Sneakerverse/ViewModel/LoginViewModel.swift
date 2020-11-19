//
//  LoginViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 19.11.20.
//

import SwiftUI

import Foundation

struct UserResponse: Codable{
    var data: String
    var accessToken: String
    var statusCode: Int?
    
    init(json: [String: Any]) {
        self.accessToken = json["accessToken"] as? String ?? ""
        self.data = json["data"] as? String ?? ""
        }
}

class LoginViewModel{
    var userResponse : UserResponse?
    
    func login(username:String, password:String) -> Bool{
        var success = false;
        let group = DispatchGroup()
        group.enter()

        sendLoginRequest(username: username, password: password, completion:
            { json, error in
                success = json.accessToken != "" ? true : false
                // will be called at either completion or at an error.
                group.leave()
            })
        group.wait() // blocks current queue so beware!
        return success
    }
    
    func sendLoginRequest(username:String, password:String, completion: @escaping (_ userResponse:UserResponse, _ error: Error?)->()) {
        let parameters = [
            "user":
                [
                    "username":"\(username)",
                    "password": "\(password)"
                ]
        ]
        print(parameters)

        //create the url with URL
        let url = URL(string: "http://localhost:3000/users/login")! //change the url

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
            if let response = response as? HTTPURLResponse {
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
                    self.userResponse = UserResponse(json: json)
                    completion(UserResponse(json: json),error)
                    print(json)
                    // handle json...
                }
            } catch _ {
                print("LOGIN REQUEST ERROR")
            }
        })
        
        task.resume()
}
    
    func authorization() -> Bool{
        var success = false;
        let group = DispatchGroup()
        group.enter()

        sendAuthorization()
            { json, error in
            success = json.accessToken != "" ? true : false
                // will be called at either completion or at an error.
                group.leave()
            }
        group.wait() // blocks current queue so beware!
        return success
    }
    
    func sendAuthorization (completion: @escaping (_ userResponse:UserResponse, _ error: Error?)->()){
        // Create URL
        let url = URL(string: "http://localhost:3000/users")
        guard let requestUrl = url else { print("request error"); return }
        // Create URL Request
        var request = URLRequest(url: requestUrl)
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("bearer \(userResponse?.accessToken ?? "")", forHTTPHeaderField: "Authorization")
        
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if error != nil {
                print("AUTHORIZATION REQUEST ERROR")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    self.userResponse = UserResponse(json: json)
                    print(json)
                    completion(UserResponse(json: json),error)
                    // handle json...
                }
            } catch _ {
                print("AUTHORIZATION REQUEST ERROR")
            }
            
        }
        task.resume()
    }
}
