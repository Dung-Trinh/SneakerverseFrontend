//
//  HomeView.swift
//  Sneakerverse
//
//  Created by Dung  on 22.11.20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
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
                Text("DEALS")
                    .tabItem {
                        Image(systemName: "tag.fill")
                        Text("Deals")
                    }

                Text("PROFILE")
                    .tabItem {
                        Image(systemName: "person.crop.rectangle.fill")
                        Text("Profile")
                    }
                ChatView()
                    .tabItem {
                        Image(systemName: "person.crop.rectangle.fill")
                        Text("Chat")
                    }
            }
        }.navigationBarHidden(true)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
