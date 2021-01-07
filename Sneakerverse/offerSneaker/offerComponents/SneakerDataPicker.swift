//
//  SizePicker.swift
//  Sneakerverse
//
//  Created by Dung  on 23.11.20.
//

import SwiftUI

enum DataPickerType: String{
    case SIZES = "Sizes"
    case CONDITION = "Condition"
    case BRANDS = "Brands"
}

struct SneakerDataPicker: View {
    let SIZES = ["6","6.5","7","7.5","8","8.5","9","9.5","10","10.5","11","11.5","12","12.5","13","13.5","14"]
    let BRANDS = ["Nike", "Adidas", "Puma", "New Balance"]
    let CONDITION = ["new", "good", "satisfactorily"]
    
    @State var selectedItemIndex = 0
    @Binding var selectedItem: String

    
    var selectionOptions : [String]
    var labelText: String?
    
    
    init(type: DataPickerType, selectedValue:Binding<String>) {
        labelText = type.rawValue
        
        switch type {
        case .SIZES:
            self.selectionOptions = SIZES
        case .BRANDS:
            self.selectionOptions = BRANDS
        case .CONDITION:
            self.selectionOptions = CONDITION
        }
        self._selectedItem = selectedValue
    }
    
    var body: some View {
        Picker(selection: $selectedItemIndex, label:
                Text(self.labelText!)){
            ForEach( 0 ..< self.selectionOptions.count){
                Text(self.selectionOptions[$0]).tag($0)
            }
        }.onChange(of: selectedItemIndex, perform: { value in
            self.selectedItem = selectionOptions[selectedItemIndex]
        })
    }
    
}

//struct SizePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        SneakerDataPicker(type: DataPickerType.BRANDS)
//    }
//}
