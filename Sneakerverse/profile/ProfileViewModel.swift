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
    @Published var offerList: [Offer] = [Offer(id: "1", name: "hi", offerDescription: "123", price: 123.45, size: 5, brand: "nike", condition: "nice", ownerName: "du", city: City(id: "1", latitude: 11.1, longitude: 11.1, cityName: "2", v: 2), created: "123", v: 1),Offer(id: "2", name: "hi", offerDescription: "123", price: 123.45, size: 5, brand: "nike", condition: "nice", ownerName: "du", city: City(id: "1", latitude: 11.1, longitude: 11.1, cityName: "2", v: 2), created: "123", v: 1),Offer(id: "3", name: "hi", offerDescription: "123", price: 123.45, size: 5, brand: "nike", condition: "nice", ownerName: "du", city: City(id: "1", latitude: 11.1, longitude: 11.1, cityName: "2", v: 2), created: "123", v: 1),Offer(id: "4", name: "hi", offerDescription: "123", price: 123.45, size: 5, brand: "nike", condition: "nice", ownerName: "du", city: City(id: "1", latitude: 11.1, longitude: 11.1, cityName: "2", v: 2), created: "123", v: 1), Offer(id: "5", name: "hi", offerDescription: "123", price: 123.45, size: 5, brand: "nike", condition: "nice", ownerName: "du", city: City(id: "1", latitude: 11.1, longitude: 11.1, cityName: "2", v: 2), created: "123", v: 1),Offer(id: "6", name: "hi", offerDescription: "123", price: 123.45, size: 5, brand: "nike", condition: "nice", ownerName: "du", city: City(id: "1", latitude: 11.1, longitude: 11.1, cityName: "2", v: 2), created: "123", v: 1),Offer(id: "7", name: "hi", offerDescription: "123", price: 123.45, size: 5, brand: "nike", condition: "nice", ownerName: "du", city: City(id: "1", latitude: 11.1, longitude: 11.1, cityName: "2", v: 2), created: "123", v: 1)]
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
