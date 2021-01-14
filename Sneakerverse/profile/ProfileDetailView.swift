//
//  ProfileDetailView.swift
//  Sneakerverse
//
//  Created by Dung  on 14.01.21.
//

import SwiftUI

struct ProfileDetailView: View {
    let DealsOffer = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Binding var offerList: [Offer]
    
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: UIImage(#imageLiteral(resourceName: "1")))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                    .padding(.top, 10)
            }
            Text("TestUser")
            Text("Wiesbaden")
            Text("Registriert seit 2020")
            RatingBar(currentRating: 3, ratingAmount: 3)
                .padding(.bottom, 20)
            
            Text("My offers")
            LazyVGrid(columns: DealsOffer, spacing: 20) {
                ForEach(offerList){ offer in
                    VStack{
                        DealsOverviewListItemView(offer: offer)
                    }
                }
            }
        }
    }
}

struct ProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailView(offerList: .constant([]))
    }
}
