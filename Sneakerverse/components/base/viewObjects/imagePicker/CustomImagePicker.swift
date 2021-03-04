//
//  CustomImagePicker.swift
//  Sneakerverse
//
//  Created by Dung  on 07.01.21.
//

import SwiftUI
import Photos

struct CustomImagePicker: View {
    @Binding var selectedImages : [UIImage]
    @Binding var showSelectedButton : Bool
    
    @State var imagesInGrid : [[ImageData]] = []
    @State var storageAccessOn = false
    
    var body: some View{
        ScrollView{
            VStack{
                Button(action: {
                    self.showSelectedButton.toggle()
                }) {
                    Text("Select")
                        .foregroundColor(.blue)
                        .padding(.vertical,10)
                        .frame(width: UIScreen.main.bounds.width / 2)
                }
                .background(Color.red.opacity((self.selectedImages.count != 0) ? 1 : 0.5))
                .clipShape(Capsule())
                .padding(.bottom)
                .disabled((self.selectedImages.count != 0) ? false : true)
                
                if !self.imagesInGrid.isEmpty{
                    
                    HStack{
                        Text("Pick a Image")
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    .padding(.leading)
                    .padding(.top)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20){
                            ForEach(self.imagesInGrid,id: \.self){i in
                                HStack{
                                    ForEach(i,id: \.self){ j in
                                        ImagePreview(data: j, selected: self.$selectedImages)
                                    }
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                    
                }
                else{
                    if self.storageAccessOn == false{
                        Text("Enable Storage Access In Settings !!!")
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height / 1.5)
            .background(Color.white)
            .cornerRadius(12)
        }
        .background(Color.white.opacity(0.1).edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            
                            self.showSelectedButton.toggle()
                            
                        })
        .onAppear {
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized{
                    self.getAllImages()
                    self.storageAccessOn = true
                }else{
                    print("not authorized")
                    self.storageAccessOn = false
                }
            }
        }
    }
    
    func getAllImages(){
        let opt = PHFetchOptions()
        opt.includeHiddenAssets = false
        
        let req = PHAsset.fetchAssets(with: .image, options: .none)
        
        DispatchQueue.global(qos: .background).async {
            
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            
            for i in stride(from: 0, to: req.count, by: 3){
                
                var iteration : [ImageData] = []
                
                for j in i..<i+3{
                    
                    if j < req.count{
                        
                        PHCachingImageManager.default().requestImage(for: req[j], targetSize: CGSize(width: 150, height: 150), contentMode: .default, options: options) { (image, _) in
                            
                            let imageData = ImageData(image: image!, selected: false, asset: req[j])
                            
                            iteration.append(imageData)
                        }
                    }
                }
                
                self.imagesInGrid.append(iteration)
            }
            
        }
    }
}

//struct CustomImagePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomImagePicker()
//    }
//}
