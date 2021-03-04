//
//  DealsOverviewItemListView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 03.12.20.
//

import SwiftUI

struct DealsOverviewListItemView: View {
    var offer: Offer
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(.white).opacity(0.6)
            VStack {
                Image("default-sneaker")
                    .resizable()
                    .frame(width: 110, height: 110)
                Text(offer.city.cityName)
                        .font(.system(size:15))
                    .foregroundColor(DESIGN.COLOR.darkPurple)
                Text(offer.name)
                    .font(.system(size:15))
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .padding(.bottom,5)
                HStack {
                    Spacer()
                    Text("\(offer.price, specifier: "%.2f") $")
                        .font(.system(size:15))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .padding(.bottom,5)
                }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }.frame(width: 180, height: 180)
        .padding()
    }
}

struct DealsOverviewItemListView_Previews: PreviewProvider {
    static var previews: some View {
        DealsOverviewListItemView(offer: Offer(id: "123123", name: "Test Sneaker", offerDescription: "testi description", price: 30, size: 8, brand: "Nike", condition: "new", ownerName: "Hoang", ownerID: "123", city: City(id: "asdasda", latitude: 8.6, longitude: 9.0, cityName: "Wiesbaden"), created: "2021-01-06T19:22:16.459Z", v: 0))
            .previewLayout(.sizeThatFits)
    }
}
