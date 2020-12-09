//
//  OfferSneakerViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 26.11.20.
//

import Foundation

class OfferSneakerViewModel: ObservableObject {
    @Published var sneakerName = "adidas UltraBOOST"
    @Published var description = "feels good"
    @Published var price = "180"
    @Published var size = "9.5"
    @Published var brand = "Adidas"
    @Published var condition = "New"
    
    var sneakerService = SneakerService()
    
    func offerSneaker(sneakerOffer: SneakerOffer,completion: @escaping (Bool)->Void){
        let success = sneakerService.sendSneakerOfferRequest(sneakerOffer: sneakerOffer, completion: { response in
            print(response!)
            completion(response?.statusCode == 200)
        })

        return success
    }
}
