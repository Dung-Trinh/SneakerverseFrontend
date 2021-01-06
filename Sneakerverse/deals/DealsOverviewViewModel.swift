//
//  DealsOverviewViewModel.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 03.12.20.
//

import Foundation

struct DealsOVerviewViewModel{
    var sneakerService = SneakerService()
    
    func fetchSneaker( completion: @escaping ([Offer])->Void) {
        sneakerService.getAllSneakerOffers(completion: { response in
            switch response{
            case .success(let offerList):
                completion(offerList)
            case .failure:
                print("fetch Sneaker Deals failed")
                completion([])
            }
        })
    }
}
