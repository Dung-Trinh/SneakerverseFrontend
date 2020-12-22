//
//  OfferSneakerView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.11.20.
//

import SwiftUI

struct OfferSneakerView: View {
    @StateObject var offerViewModel = OfferSneakerViewModel()
    
    @State var isValid = true
    @State var showResponse: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Form{
                    Section{
                        Group{
                            Image(systemName: "plus.circle.fill")
                            Text("add picture")
                        }
                    }
                    VStack{
                        CustomTextField(storedText: $offerViewModel.sneakerName, placholderText: "Sneaker name",type: .TEXT,icon: Image(systemName: "person.fill"))
                        CustomTextField(storedText: $offerViewModel.description, placholderText: "Description",type: .TEXT, icon: Image(systemName:"text.below.photo.fill"))
                        CustomTextField(storedText: $offerViewModel.price, placholderText: "Price",type: .NUMBERS, icon: Image(systemName:"tag.fill"))
                        
                    }
                    Section{
                        SneakerDataPicker(type: DataPickerType.SIZES, selectedValue: $offerViewModel.size)
                        SneakerDataPicker(type: DataPickerType.BRANDS, selectedValue: $offerViewModel.brand)
                        SneakerDataPicker(type: DataPickerType.CONDITION, selectedValue: $offerViewModel.condition)
                    }
                    Button(action: {
                        print( """
                        name: \(offerViewModel.sneakerName)
                        description: \(offerViewModel.description)
                        price: \(offerViewModel.price)
                        size: \(offerViewModel.size)
                        brand: \(offerViewModel.brand)
                        condition: \(offerViewModel.condition)
                        """)
                        
                        offerViewModel.offerSneaker(sneakerOffer: SneakerOffer(sneakerName: offerViewModel.sneakerName, description: offerViewModel.description, price: offerViewModel.price, size: offerViewModel.size, brand: offerViewModel.size, condition: offerViewModel.condition), completion: {success in
                            if (success){
                                self.showResponse = true
                            }
                        })
                        
                    }) {
                        CustomButton(buttonText: "add sneaker", buttonColor: .blue)
                    }
                }
                
                
                
                
                
            }
            
            if showResponse {
                
                PopUpView(show: $showResponse)
            }
        }
        .padding()
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OfferSneakerView_Previews: PreviewProvider {
    static var previews: some View {
        OfferSneakerView()
    }
}
