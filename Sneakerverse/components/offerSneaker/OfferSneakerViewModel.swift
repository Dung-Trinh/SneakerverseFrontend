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
    var currentCity = City(id: "", latitude: 0, longitude: 0, cityName: "")
    var sneakerService = SneakerService()
    
    func sendSneakerOffer(completion: @escaping (Bool)->Void){
        self.fetchCity(completion: {
            
            
            let newSneakerOffer = SneakerOffer(sneakerName: self.sneakerName,
                                               description: self.description,
                                               price: self.price,
                                               size: self.size,
                                               brand: self.brand,
                                               condition: self.condition,
                                               city: self.currentCity)
            self.sneakerService.sendSneakerOfferRequest(sneakerOffer: newSneakerOffer, completion: { response in
                print("sneaker gesendet")
                switch response{
                case .success(let offerID):
                    self.sneakerService.uploadImage(offerID: offerID ,images: self.selectedImages)
                    
                    completion(true)
                case .failure:
                    completion(false)
                }
            })
        })
    }
    func fetchCity(completion: @escaping ()->Void){
        sneakerService.getCityLocation(city: self.city, completion: { cityResponse in
            print("city gesendet")
            
            switch cityResponse{
            case .success(let cityData):
                self.currentCity = cityData
                print(self.currentCity)
            case .failure: break
                print("keine city")
            }
            completion()
        })
    }
    
    func clearValues(){
        sneakerName = ""
        description = ""
        city = ""
        price = ""
    }
}
