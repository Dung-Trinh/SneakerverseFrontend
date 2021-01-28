//
//  BlogPostService.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 28.01.21.
//

import Foundation
import KeychainAccess
import Alamofire

class BlogPostService{
    let headers: HTTPHeaders
    let accessToken : String = Keychain(service: "sneakerverse.Sneakerverse")["accessToken"]!
    let jsonDecoder = JSONDecoder()
    
    init(){
        headers = [
            "Content-Type": "application/json",
            "Authorization": "bearer \(self.accessToken)"
        ]
    }
    
    func getAllBlogPosts(completion:@escaping(Result<[Blog],BlogPostServiceError>)->Void){
        AF.request(API.BLOGPOST, method: .get, encoding: JSONEncoding.default,headers: headers).responseJSON { response in
            
            var statusCode: Int?
            var blogPostResponse: BlogPostResponse
            statusCode = response.response?.statusCode
            
            switch statusCode {
            case 200:
                if response.data != nil{
                    blogPostResponse = try!
                        self.jsonDecoder.decode(BlogPostResponse.self, from: response.data!)
                    completion(.success(blogPostResponse.data.blogposts))
                }
            case .none, .some(_):
                completion(.failure(.blogPostError))
            }
        }
    }
}
