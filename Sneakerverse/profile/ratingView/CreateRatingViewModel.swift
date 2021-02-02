//
//  CreateRatingViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 29.01.21.
//

import Foundation

class CreateRatingViewModel: ObservableObject {
    @Published var rating: Int = 0
    @Published var desciption = ""
    var profileService = ProfileService()
    
    func sendRating(){
        
    }
}
