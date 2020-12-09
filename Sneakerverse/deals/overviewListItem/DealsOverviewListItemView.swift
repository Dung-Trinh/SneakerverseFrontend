//
//  DealsOverviewItemListView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 03.12.20.
//

import SwiftUI

struct DealsOverviewListItemView: View {
    var title: String
    var price: Int
    var location: String
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
                        .frame(width: 180, height: 180)
                        .offset(x: -10, y: 0)
                    Button(action: {}) {
                            IconButton(iconName: "star")
                                .offset(x: -20, y: -80)
                    }
                }
                    Text(location)
                        .offset(x: 0, y: -20)
                        .foregroundColor(.gray)
                HStack {
                    Text(title)
                        .font(.system(size:20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Text("\(price) $")
                        .bold()
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }.padding(.horizontal, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }.frame(width: 300, height: 300)
    }
}

struct DealsOverviewItemListView_Previews: PreviewProvider {
    static var previews: some View {
        DealsOverviewListItemView(title:"Test Sneaker", price: 20, location: "Wiesbaden")
            .previewLayout(.sizeThatFits)
    }
}
