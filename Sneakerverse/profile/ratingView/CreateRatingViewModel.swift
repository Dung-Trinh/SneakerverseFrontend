//
//  CreateRatingViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 29.01.21.
//

import Foundation

class CreateRatingViewModel: ObservableObject {
    @Published var rating: Int = 1
    @Published var message = ""
    var targetUser = ""
    var profileService = ProfileService()
    
    func sendRating(completion: @escaping (Bool)->Void){
        print(rating)
        profileService.sendUserRating(message: self.message, rating: self.rating, targetUser: self.targetUser, completion: {response in
            switch response{
            case .success:
                completion(true)
            case .failure:
                completion(false)
            }
        })
    }
}
