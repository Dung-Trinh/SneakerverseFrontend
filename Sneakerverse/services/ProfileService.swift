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
    
    func fetchProfileData(completion: @escaping (Result<UserProfileDetails, ProfileError>) -> Void){
        let parameters = ["username" : "\(username)"]
        
        AF.request(API.GET_PROFILE, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            var profileResponse: ProfileResponse

            switch statusCode {
            case 200:
                if response.data != nil{
                    profileResponse = try! self.jsonDecoder.decode(ProfileResponse.self, from: response.data!)
                    completion(.success(profileResponse.data.userProfile))
                }
            case 404:
                completion(.failure(.userNotFound))
            case .none, .some(_):
                completion(.failure(.profileError))
            }
        }
        
    }
    
    func getRatingByIDs(ratingIDs: [String],completion: @escaping (Result<[Rating], ProfileError>) -> Void){
        let parameters = ["ids" : ""]
        
        AF.request(API.GET_PROFILE, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            var ratingResponse: RatingResponse

            switch statusCode {
            case 200:
                if response.data != nil{
                    ratingResponse = try! self.jsonDecoder.decode(RatingResponse.self, from: response.data!)
                    completion(.success(ratingResponse.data.ratings))
                }
            case .none, .some(_):
                completion(.failure(.profileError))
            }
        }
        
    }
}
