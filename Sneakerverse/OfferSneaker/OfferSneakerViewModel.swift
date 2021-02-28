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
    @Published var sneakerName = ""
    @Published var description = ""
    @Published var price = ""
    @Published var size = ""
    @Published var brand = ""
    @Published var condition = ""
    @Published var selectedImages : [UIImage] = [#imageLiteral(resourceName: "default-sneaker")]
    @Published var showResponse: Bool = false
    @Published var showImagePicker = false
    @Published var city = ""
    @Published var showPopup = false
    @Published var successfulRequest = false
    var sneakerService = SneakerService()
    
    func sendSneakerOffer(completion: @escaping (Bool)->Void){
        var currentCity: City = City(id: "", latitude: 0, longitude: 0, cityName: "")
        sneakerService.getCityLocation(city: self.city, completion: { cityResponse in
            switch cityResponse{
            case .success(let cityData):
                currentCity = cityData
            case .failure: break
                
            }
        })
        
        let newSneakerOffer = SneakerOffer(sneakerName: self.sneakerName,
                                           description: self.description,
                                           price: self.price,
                                           size: self.size,
                                           brand: self.brand,
                                           condition: self.condition,
                                           city: currentCity)
        self.sneakerService.sendSneakerOfferRequest(sneakerOffer: newSneakerOffer, completion: { response in
            switch response{
            case .success(let offerID):
                self.sneakerService.uploadImage(offerID: offerID ,images: self.selectedImages)
                
                completion(true)
            case .failure:
                completion(false)
            }
        })
    }
    
    func clearValues(){
        sneakerName = ""
        description = ""
        city = ""
        price = ""
    }
}
