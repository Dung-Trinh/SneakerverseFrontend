//
//  ProfileView.swift
//  Sneakerverse
//
//  Created by Dung  on 10.01.21.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    var username: String? = nil
    let DealsOffer = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            if(profileViewModel.isMyProfile()){
                Picker("profileMenu", selection: $profileViewModel.pickerIndex) {
                    ForEach(0..<profileViewModel.menuItems.count, id:\.self) { index in
                        Text(self.profileViewModel.menuItems[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            ScrollView{
                if(profileViewModel.pickerIndex == 0){
                    if(profileViewModel.userProfileViewData != nil){
                        ProfileDetailView(offerList: $profileViewModel.offerList,
                                          rating: $profileViewModel.ratings,
                                          userData: profileViewModel.userProfileViewData!)
                    }
                }else if(profileViewModel.pickerIndex == 1){
                    Text("\"coming soon\"")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                }
            }
        }.onAppear{
            profileViewModel.username = username != nil ? username! : ""
            
            profileViewModel.fetchUserData(completion: {_ in})
        }
        .background(DESIGN.COLOR.backgroundGradient)
        .navigationBarItems(trailing:
                                NavigationLink(destination: CreateRatingView(targetUser: username ?? "")) {
                                    Text("Rate user")
                                }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
