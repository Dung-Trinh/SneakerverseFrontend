//
//  HomeViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 31.12.20.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var loggedOut = false
    var chatService = ChatService()
    var profileService = ProfileService()
    
    func logout(){
        profileService.sendLogoutReqest(completion: {  response in
            switch response{
            case.success:
                self.loggedOut = true
            case .failure:
                print("logoutError")
            }
        })
    }
}
