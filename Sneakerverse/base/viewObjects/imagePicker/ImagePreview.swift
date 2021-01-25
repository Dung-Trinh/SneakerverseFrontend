//
//  ImagePreview.swift
//  Sneakerverse
//
//  Created by Dung  on 07.01.21.
//

import SwiftUI
import Photos

struct ImagePreview: View {
    @State var data : ImageData
    @Binding var selected : [UIImage]
    
    var body: some View{
        ZStack{
            Image(uiImage: self.data.image)
                .resizable()
            
            if self.data.selected{
                ZStack{
                    Color.black.opacity(0.5)
                    
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: (UIScreen.main.bounds.width - 80) / 3, height: 90)
        .onTapGesture {
            
            if !self.data.selected{
                self.data.selected = true
                
                DispatchQueue.global(qos: .background).async {
                    let options = PHImageRequestOptions()
                    options.isSynchronous = true
                    
                    PHCachingImageManager.default().requestImage(for: self.data.asset, targetSize: .init(), contentMode: .default, options: options) { (image, _) in
                        DispatchQueue.main.async {
                            self.selected.append(image!)
                        }
                    }
                }
            }
        }
    }
}

//struct ImagePreview_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagePreview()
//    }
//}
