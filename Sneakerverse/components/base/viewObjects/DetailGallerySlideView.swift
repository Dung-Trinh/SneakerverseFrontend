//
//  DetailGallerySlideView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 08.01.21.
//

import SwiftUI
import Kingfisher

struct DetailGallerySlideView: View {
    var imageList: [String]
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader{ proxy in
            TabView{
                ForEach(0..<imageList.count){
                    num in
                    KFImage.url(URL(string: self.imageList[num]))
                        .loadDiskFileSynchronously()
                        .placeholder{return Image("default-calendar-sneaker")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 170)}
                        .cacheMemoryOnly()
                        .onProgress { receivedSize, totalSize in  }
                        .onSuccess { result in  }
                        .onFailure { error in }
                        .resizable()
                        .frame(width: .infinity, height: 250)
                        .scaledToFit()
                }
            }.tabViewStyle(PageTabViewStyle())
            .onReceive(timer, perform: { _ in
                withAnimation{
                    currentIndex = currentIndex <
                        imageList.count ? currentIndex+1 : 0
                }
            })
        }
    }
}

struct DetailGallerySlideView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGallerySlideView(imageList: [""])
    }
}
