//
//  OfferSneakerView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.11.20.
//

import SwiftUI

struct OfferSneakerView: View {
    @State var sneakerName = ""
    @State var sneakerDescription = ""
    @State var price = ""


    var body: some View {
        Form{
            Section{
            Group{
                Image(systemName: "plus.circle.fill")
                Text("add picture")
            }
            }
        VStack{
            
            
            CustomTextField(storedText: $sneakerName, placholderText: "Sneaker name",type: .TEXT,icon: Image(systemName: "person.fill"))
            CustomTextField(storedText: $sneakerDescription, placholderText: "Description",type: .TEXT, icon: Image(systemName:"text.below.photo.fill"))
            CustomTextField(storedText: $price, placholderText: "Price",type: .NUMBERS, icon: Image(systemName:"tag.fill"))
            
        }
            Section{
                SneakerDataPicker(type: DataPickerType.SIZES)
                SneakerDataPicker(type: DataPickerType.BRANDS)
                SneakerDataPicker(type: DataPickerType.CONDITION)
            }
        }
        
    }
}

struct OfferSneakerView_Previews: PreviewProvider {
    static var previews: some View {
        OfferSneakerView()
    }
}
