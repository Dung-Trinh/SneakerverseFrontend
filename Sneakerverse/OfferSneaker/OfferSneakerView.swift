//
//  OfferSneakerView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.11.20.
//

import SwiftUI

struct OfferSneakerView: View {
    @ObservedObject var viewModel = OfferSneakerViewModel()
    
    @State var isValid = true
    
    var body: some View {
        VStack{
            Form{
                Section{
                    Group{
                        Image(systemName: "plus.circle.fill")
                        Text("add picture")
                    }
                }
                VStack{
                    CustomTextField(storedText: $viewModel.sneakerName, placholderText: "Sneaker name",type: .TEXT,icon: Image(systemName: "person.fill"))
                    CustomTextField(storedText: $viewModel.description, placholderText: "Description",type: .TEXT, icon: Image(systemName:"text.below.photo.fill"))
                    CustomTextField(storedText: $viewModel.price, placholderText: "Price",type: .NUMBERS, icon: Image(systemName:"tag.fill"))
                    
                }
                Section{
                    SneakerDataPicker(type: DataPickerType.SIZES, selectedValue: $viewModel.size)
                    SneakerDataPicker(type: DataPickerType.BRANDS, selectedValue: $viewModel.brand)
                    SneakerDataPicker(type: DataPickerType.CONDITION, selectedValue: $viewModel.condition)
                }
            }
            
            Button(action: {
                print( """
                    name: \(viewModel.sneakerName)
                    description: \(viewModel.description)
                    price: \(viewModel.price)
                    size: \(viewModel.size)
                    brand: \(viewModel.brand)
                    condition: \(viewModel.condition)
                    """)
                
            }) {
                CustomButton(buttonText: "add sneaker", buttonColour: .blue)
            }
        }
    }
}

struct OfferSneakerView_Previews: PreviewProvider {
    static var previews: some View {
        OfferSneakerView()
    }
}
