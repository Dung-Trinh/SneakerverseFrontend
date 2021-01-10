//
//  ProfileService.swift
//  Sneakerverse
//
//  Created by Dung  on 10.01.21.
//

import Foundation
import KeychainAccess
import Alamofire

class ProfileService: ObservableObject{
    var headers: HTTPHeaders
    let jsonDecoder = JSONDecoder()
    var accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    var username: String = Keychain(service: "sneakerverse.Sneakerverse")["username"]!
    
    init(){
        headers = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
    }
    
    func fetchProfileData(username: String, completion: @escaping (Result<UserProfileDetails, ProfileError>) -> Void){
        let parameters = ["username" : "Tim119"]
        
        AF.request(API.PROFILE, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).response { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            var profileResponse :ProfileResponse
            print(statusCode)
            print(response)

            switch statusCode {
            case 200:
                if response.data != nil{
                    profileResponse = try! self.jsonDecoder.decode(ProfileResponse.self, from: response.data!)
                    completion(.success(profileResponse.profileData.userProfile))
                }
            case 404:
                completion(.failure(.userNotFound))
            case .none, .some(_):
                completion(.failure(.profileError))
            }
        }
        
    }
}
