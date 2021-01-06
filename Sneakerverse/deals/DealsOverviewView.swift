//
//  DealsOverviewView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 03.12.20.
//

import SwiftUI

struct DealsOverviewView: View {
    @State var viewModel: DealsOVerviewViewModel = DealsOVerviewViewModel()
    @State var offerList: [Offer] = []
    let DealsOffer = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
            ScrollView{
                LazyVGrid(columns: DealsOffer, spacing: 20) {
                    ForEach(offerList){ offer in
                        VStack{
                            DealsOverviewListItemView(offer: offer)
                        }
                    }
                }
            }
            .onAppear(perform: {
                viewModel.fetchSneaker(){ fetchedOfferList in
                    self.offerList = fetchedOfferList
                }
            })
            .navigationTitle("Sneaker Deals")
    }
}

struct DealsOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        DealsOverviewView()
    }
}
