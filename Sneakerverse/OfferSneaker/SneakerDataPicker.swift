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
    @State var selectedSize = 0
    
    var selectionOption : [String]
    var labelText: String?
    let SIZES = ["6","6.5","7"]
    let BRANDS = ["Nike", "Adidas", "Puma", "New Balance"]
    let CONDITION = ["new", "good", "satisfactorily"]
    
    init(type: DataPickerType) {
        labelText = type.rawValue
        switch type {
        case .SIZES:
            self.selectionOption = SIZES
        case .BRANDS:
            self.selectionOption = BRANDS
        case .CONDITION:
            self.selectionOption = CONDITION
        }
    }
    
    var body: some View {
        Picker(selection: $selectedSize, label:
                Text(self.labelText!)){
            ForEach( 0 ..< self.selectionOption.count){
                Text(self.selectionOption[$0]).tag($0)
            }
        }
    }
    
}
struct SizePicker_Previews: PreviewProvider {
    static var previews: some View {
        SneakerDataPicker(type: DataPickerType.BRANDS)
    }
}
