//
//  OfferSneakerView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.11.20.
//

import SwiftUI
import Photos

struct ImageData: Hashable {
    var image : UIImage
    var selected : Bool
    var asset : PHAsset
}

struct OfferSneakerView: View {
    @StateObject var offerViewModel = OfferSneakerViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                Text("Offer sneaker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                if !offerViewModel.selectedImages.isEmpty && !offerViewModel.showImagePicker{
                    ImageSilder(selectedImages: $offerViewModel.selectedImages)
                }
                
                if !offerViewModel.showImagePicker {
                    Button(action: {
                        offerViewModel.selectedImages.removeAll()
                        self.offerViewModel.showImagePicker.toggle()
                    }) {
                        Text("Select Image")
                            .foregroundColor(.white)
                            .padding(.vertical,10)
                            .frame(width: UIScreen.main.bounds.width / 2)
                    }
                    .background(Color.red)
                    .clipShape(Capsule())
                    .padding(.top, 25)
                }
                
                if self.offerViewModel.showImagePicker{
                    CustomImagePicker(selectedImages: $offerViewModel.selectedImages, showSelectedButton: $offerViewModel.showImagePicker)
                }
                
                Form{
                    VStack{
                        CustomTextField(storedText: $offerViewModel.sneakerName, placholderText: "Sneaker name",type: .TEXT,icon: Image(systemName: "person.fill"))
                        CustomTextField(storedText: $offerViewModel.description, placholderText: "Description",type: .TEXT, icon: Image(systemName:"text.below.photo.fill"))
                        CustomTextField(storedText: $offerViewModel.price, placholderText: "Price",type: .NUMBERS, icon: Image(systemName:"tag.fill"))
                        CustomTextField(storedText: $offerViewModel.city, placholderText: "City",type: .TEXT, icon: Image(systemName:"mappin"))
                        
                        
                    }
                    
                    Section{
                        SneakerDataPicker(type: DataPickerType.SIZES, selectedValue: $offerViewModel.size)
                        SneakerDataPicker(type: DataPickerType.BRANDS, selectedValue: $offerViewModel.brand)
                        SneakerDataPicker(type: DataPickerType.CONDITION, selectedValue: $offerViewModel.condition)
                    }
                    
                    Button(action: {
                        offerViewModel.sendSneakerOffer(completion: {_ in
                            
                        })
                        
                    }) {
                        CustomButton(buttonText: "add sneaker", buttonColor: .blue)
                    }
                }
            }
            
            if offerViewModel.showResponse {
                PopUpView(show: $offerViewModel.showResponse)
            }
        }
        .padding()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OfferSneakerView_Previews: PreviewProvider {
    static var previews: some View {
        OfferSneakerView()
    }
}
