//
//  HomeView.swift
//  Sneakerverse
//
//  Created by Dung  on 22.11.20.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        TabView{
            Text("HOME").tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            Text("CALENDAR")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
            OfferSneakerView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Offer Sneaker")
                }
            DealsOverviewView()
                .tabItem {
                    Image(systemName: "tag.fill")
                    Text("Deals")
                }
            
            Text("PROFILE")
                .tabItem {
                    Image(systemName: "person.crop.rectangle.fill")
                    Text("Profile")
                }
        }
        .navigationTitle("Sneaker")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing:
                                NavigationLink(destination: ChatListView().environmentObject(homeViewModel.chatService)) {
                                    Image(systemName: "message.fill")
                                }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
