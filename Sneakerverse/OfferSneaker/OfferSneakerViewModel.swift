//
//  OfferSneakerViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 26.11.20.
//

import Foundation

class OfferSneakerViewModel: ObservableObject {
    @Published var sneakerName = ""
    @Published var description = ""
    @Published var price = ""
    @Published var size = ""
    @Published var brand = ""
    @Published var condition = ""
}
