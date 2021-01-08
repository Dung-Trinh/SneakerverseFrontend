//
//  SneakerOfferDetailView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 07.01.21.
//

import SwiftUI

struct SneakerOfferDetailView: View {
    @ObservedObject var viewModel: SneakerOfferDetailViewModel = SneakerOfferDetailViewModel()
    var offer: Offer
    var body: some View {
        Text(offer.ownerName + offer.name)
    }
}

struct SneakerOfferDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SneakerOfferDetailView(offer: Offer(id: "123123", name: "Test Sneaker", offerDescription: "testi description", price: 30, size: 8, brand: "Nike", condition: "new", ownerName: "Hoang", city: City(id: "asdasda", latitude: 8.6, longitude: 9.0, cityName: "Wiesbaden", v: 0), created: "2021-01-06T19:22:16.459Z", v: 0))
    }
}
