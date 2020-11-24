//
//  OfferSneakerView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.11.20.
//

import SwiftUI

struct OfferSneakerView: View {
    @State var sneakerName = ""
    @State var description = ""
    @State var price = ""
    @State var size = ""
    @State var brand = ""
    @State var condition = ""
    
    
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
                    CustomTextField(storedText: $sneakerName, placholderText: "Sneaker name",type: .TEXT,icon: Image(systemName: "person.fill"))
                    CustomTextField(storedText: $description, placholderText: "Description",type: .TEXT, icon: Image(systemName:"text.below.photo.fill"))
                    CustomTextField(storedText: $price, placholderText: "Price",type: .NUMBERS, icon: Image(systemName:"tag.fill"))
                    
                }
                Section{
                    SneakerDataPicker(type: DataPickerType.SIZES, selectedValue: $size)
                    SneakerDataPicker(type: DataPickerType.BRANDS, selectedValue: $brand)
                    SneakerDataPicker(type: DataPickerType.CONDITION, selectedValue: $condition)
                }
            }
            
            Button(action: {
                print( """
                    name: \(sneakerName)
                    description: \(description)
                    price: \(price)
                    size: \(size)
                    brand: \(brand)
                    condition: \(condition)
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
