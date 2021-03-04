//
//  ImageSilder.swift
//  Sneakerverse
//
//  Created by Dung  on 06.01.21.
//

import SwiftUI

struct ImageSilder: View {
    @Binding var selectedImages: [UIImage]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(selectedImages,id: \.self){ image in
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 40, height: 250)
                        .cornerRadius(15)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

//struct ImageSilder_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageSilder()
//    }
//}
