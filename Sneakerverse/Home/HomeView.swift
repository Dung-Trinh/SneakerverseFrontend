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
                Text("").tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                Text("")
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Calendar")
                    }
                OfferSneakerView()
                    .tabItem {
                        Image(systemName: "plus.circle.fill")
                        Text("Offer Sneaker")
                    }
                Text("The content of the first view")
                    .tabItem {
                        Image(systemName: "person.crop.rectangle.fill")
                        Text("Profile")
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
