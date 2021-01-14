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
    @Published var city = ""
    var sneakerService = SneakerService()
    
    func sendSneakerOffer(completion: @escaping (Bool)->Void){
        sneakerService.getCityLocation(city: self.city, completion: { cityResponse in
            switch cityResponse{
            case .success(let cityData):
                let newSneakerOffer = SneakerOffer(sneakerName: self.sneakerName,
                                                   description: self.description,
                                                   price: self.price,
                                                   size: self.size,
                                                   brand: self.brand,
                                                   condition: self.condition,
                                                   city: cityData)
                
                self.sneakerService.sendSneakerOfferRequest(sneakerOffer: newSneakerOffer, completion: { response in
                    switch response{
                    case .success:
                        completion(true)
                    case .failure:
                        completion(false)
                    }
                })
                
            case .failure:
                completion(false)
            }
            
            
        })
    }
}
