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
    
    init(){
        headers = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
    }
    
    func fetchProfileData(username: String, completion: @escaping (Result<UserProfileDetails, ProfileError>) -> Void){
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
        let parameters = ["ids" : ratingIDs]
        
        AF.request(API.GET_RATING_BY_ID, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { response in
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
    
    func sendUserRating(message: String, rating: Int, targetUser: String,completion: @escaping (Result<Bool, ProfileError>) -> Void){
        let parameters = ["rating" :
                            ["targetUsername" : targetUser,
                             "rating": "\(rating)",
                             "message": message
                            ]
        ]
        
        AF.request(API.SEND_RATING, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).response { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            print("send rating \(statusCode)")
            
            switch statusCode {
            case 200:
                completion(.success(true))
            case .none, .some(_):
                completion(.failure(.profileError))
            }
        }
    }
    
    func sendLogoutReqest(completion:@escaping (Result<Bool, ProfileError>) -> Void){
        AF.request(API.LOGOUT, method: .post, encoding: JSONEncoding.default, headers: headers).response { response in
            var statusCode: Int?
            statusCode = response.response?.statusCode
            switch statusCode {
            case 200:
                completion(.success(true))
            case .none, .some(_):
                completion(.failure(.profileError))
            }
        }
    }
    
    func fetchOfferByID(ids: [String], completion:@escaping(Result<[Offer],ProfileError>)->Void){
        let parameters = [
            "ids": ids
        ]
        
        AF.request(API.SELECTED_OFFER, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            
            var statusCode: Int?
            var deals: SelectedDealsResponse
            statusCode = response.response?.statusCode
            
            print(statusCode!)
            print(response.data!)
            switch statusCode {
            case 200:
                if response.data != nil{
                    deals = try! self.jsonDecoder.decode(SelectedDealsResponse.self, from: response.data!)
                    print(deals)
                    completion(.success(deals.data.offers ?? []))
                }
            case .none, .some(_):
                completion(.failure(.profileError))
            }
        }
    }
}
