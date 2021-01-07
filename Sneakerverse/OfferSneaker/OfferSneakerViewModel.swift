//
//  OfferSneakerViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 26.11.20.
//

import Foundation
import Photos
import SwiftUI

class OfferSneakerViewModel: ObservableObject {
    @Published var sneakerName = "adidas UltraBOOST"
    @Published var description = "feels good"
    @Published var price = "180"
    @Published var size = "9.5"
    @Published var brand = "Adidas"
    @Published var condition = "New"
    @Published var selectedImages : [UIImage] = [#imageLiteral(resourceName: "default-sneaker")]
    @Published var showResponse: Bool = false
    @Published var showImagePicker = false
    
    var sneakerService = SneakerService()
    
    func offerSneaker(sneakerOffer: SneakerOffer,completion: @escaping (Bool)->Void){
        sneakerService.sendSneakerOfferRequest(sneakerOffer: sneakerOffer, completion: { response in
            switch response{
            case .success:
                completion(true)
            case .failure:
                completion(false)
            }
        })

    }
}
