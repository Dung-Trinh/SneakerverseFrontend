//
//  ProfileViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 10.01.21.
//

import Foundation
import KeychainAccess

class ProfileViewModel: ObservableObject {
    @Published var profileData: UserProfileDetails?
    @Published var userProfileViewData: UserProfileViewData?
    @Published var ratings: [Rating] = []
    @Published var offerList: [Offer] = []
    @Published var menuItems: [String] = []
    @Published  var pickerIndex = 0
    var profileService = ProfileService()
    var myUserName = Keychain(service: "sneakerverse.Sneakerverse")["username"]!
    var username: String = "" {
        didSet {
            if(isMyProfile()){
                menuItems =  ["Profile", "Favorites"]
            }else{
                menuItems = ["Profile"]
            }
        }
    }
    
    func fetchUserData(completion: @escaping (Bool)->Void){
        if(username == ""){
            username = myUserName
        }
        
        profileService.fetchProfileData(username: username,completion: { response in
            switch response {
            case .success(let data):
                self.setProfileData(profileData: data)
                self.userProfileViewData = UserProfileViewData(username: self.profileData!.username, registerDate: self.profileData!.registered, city: "", image: nil)
                self.profileService.getRatingByIDs(ratingIDs: data.ratings, completion: {response in
                    switch response {
                    case .success(let data):
                        self.ratings = data
                    case .failure:
                        print("error fetch rating")
                    }
                })
                self.fetchMyOffer(ids: data.offers)
                completion(true)
            case .failure:
                print("error")
                completion(false)
            }
        })
    }
    
    func fetchMyOffer(ids: [String]){
        profileService.fetchOfferByID(ids: ids, completion: { response in
            switch response{
            case .success(let myOffer):
                self.offerList = myOffer
            case .failure:
                break
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
    
    func isMyProfile() -> Bool{
        if(username == myUserName){
            return true
        }else{
            return false
        }
    }
}
