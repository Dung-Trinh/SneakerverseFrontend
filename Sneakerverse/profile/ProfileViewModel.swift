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
    var profileService = ProfileService()
    var username: String = Keychain(service: "sneakerverse.Sneakerverse")["username"]!

    func getProfileData(username: String, completion: @escaping (Bool)->Void){
        profileService.fetchProfileData(username: username, completion: { response in
            switch response {
            case .success(let data):
                self.profileData = data
                print(data)
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
}
