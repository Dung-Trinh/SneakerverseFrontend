//
//  ProfileView.swift
//  Sneakerverse
//
//  Created by Dung  on 10.01.21.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        VStack{
            Text("\(profileViewModel.username)")
            Text("\(profileViewModel.profileData?.registered ?? "")")
        }
        .onAppear {
            profileViewModel.getProfileData(username: profileViewModel.username, completion: {response in})
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
