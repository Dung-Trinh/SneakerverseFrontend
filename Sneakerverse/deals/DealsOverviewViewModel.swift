//
//  DealsOverviewViewModel.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 03.12.20.
//

import Foundation

struct DealsOVerviewViewModel{
    var sneakerService = SneakerService()
    
    func fetchSneaker( completion: @escaping (Bool)->Void) {
        sneakerService.getAllSneakerOffers { (response) in
            completion(response?.statusCode == 200)
        }
    }
}
