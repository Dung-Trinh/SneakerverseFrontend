//
//  ProfileView.swift
//  Sneakerverse
//
//  Created by Dung  on 10.01.21.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    
    let DealsOffer = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack{
            Picker("profileMenu", selection: $profileViewModel.pickerIndex) {
                ForEach(0..<profileViewModel.menuItems.count) { index in
                    Text(self.profileViewModel.menuItems[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            ScrollView{
                if(profileViewModel.pickerIndex == 0){
                    ProfileDetailView(offerList: $profileViewModel.offerList)
                }else if(profileViewModel.pickerIndex == 1){
                    
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
