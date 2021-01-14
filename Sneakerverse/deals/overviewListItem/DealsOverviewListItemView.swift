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
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            VStack {
                HStack {
                    Spacer()
                    Image("default-sneaker")
                        .resizable()
                        .frame(width: 110, height: 120)
                        .offset(x: -10, y: 0)
                    Button(action: {}) {
                            IconButton(iconName: "star")
                                .offset(x: -20, y: -30)
                    }
                }
                Text(offer.city.cityName)
                        .offset(x: 0, y: -10)
                        .foregroundColor(.gray)
                HStack {
                    Text(offer.name)
                        .font(.system(size:20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("\(offer.price) $")
                        .bold()
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }.frame(width: 200, height: 200)
    }
}

struct DealsOverviewItemListView_Previews: PreviewProvider {
    static var previews: some View {
        DealsOverviewListItemView(offer: Offer(id: "123123", name: "Test Sneaker", offerDescription: "testi description", price: 30, size: 8, brand: "Nike", condition: "new", ownerName: "Hoang", city: City(id: "asdasda", latitude: 8.6, longitude: 9.0, cityName: "Wiesbaden"), created: "2021-01-06T19:22:16.459Z", v: 0))
            .previewLayout(.sizeThatFits)
    }
}
