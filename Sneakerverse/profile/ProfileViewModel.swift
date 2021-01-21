//
//  ProfileViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 10.01.21.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var profileData: UserProfileDetails?
    @Published var userProfileViewData: UserProfileViewData?
    @Published var ratings: [Rating] = []
    @Published var offerList: [Offer] = []
    var menuItems = ["Profile", "Favorites"]
    @Published  var pickerIndex = 0
    var profileService = ProfileService()
    
    func fetchUserData(completion: @escaping (Bool)->Void){
        profileService.fetchProfileData(completion: { response in
            switch response {
            case .success(let data):
                self.setProfileData(profileData: data)
                self.userProfileViewData = UserProfileViewData(username: self.profileData!.username, registerDate: self.profileData!.registered, city: "Stadt fehlt", image: nil)
                self.profileService.getRatingByIDs(ratingIDs: data.ratings, completion: {response in
                    switch response {
                    case .success(let data):
                        self.ratings = data
                    case .failure:
                        print("error fetch rating")
                    }
                })
                completion(true)
            case .failure:
                print("error")
                completion(false)
            }
        })
    }
    
    func setProfileData(profileData: UserProfileDetails){
        self.profileData = profileData
    }
    
    func fetchUserRatings(){
        profileService.getRatingByIDs(ratingIDs: self.profileData!.ratings, completion: { response in
            switch response {
            case .success(let data):
                self.ratings = data
            case .failure:
                print("error")
            }
        })
    }
}
