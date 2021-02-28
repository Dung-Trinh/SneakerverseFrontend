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
    let chatService = ChatService()
    @Binding var offerList: [Offer]
    @Binding var rating: [Rating]
    var userData: UserProfileViewData
    
    var body: some View {
        VStack{
            HStack{
                Image(uiImage: UIImage(#imageLiteral(resourceName: "1")))
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
                    .padding(.top, 10)
            }
            Text(userData.username)
                .font(.callout)
                .fontWeight(.bold)
            Text(userData.city)
            Text("Registriert seit \(userData.registerDate)")
            
            if(!rating.isEmpty){
                RatingBar(userRating: $rating)
                    .padding(.bottom, 20)
            }
            Spacer()
            Text("My offers")
                .font(.title)
                .fontWeight(.bold)
            LazyVGrid(columns: DealsOffer, spacing: 20) {
                ForEach(offerList){ offer in
                    VStack{
                        NavigationLink(
                            destination: SneakerOfferDetailView(offer:offer).environmentObject(self.chatService)){
                            DealsOverviewListItemView(offer: offer)
                        }
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

//struct ProfileDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileDetailView(offerList: .constant([]), userData: <#UserProfileViewData#>)
//    }
//}
