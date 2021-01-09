//
//  DetailGallerySlideView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 08.01.21.
//

import SwiftUI

struct DetailGallerySlideView: View {
    var imageList: [UIImage] = []
    private var numberOfImages = 3
    @State private var currentIndex = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader{ proxy in
            TabView{
                ForEach(0..<numberOfImages){
                    num in
                    Image("sneakerDefault"+"\(num)")
                        .resizable()
                        .scaledToFill()
                        .tag(num)
                }
            }.tabViewStyle(PageTabViewStyle())
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding()
            .frame(width: proxy.size.width, height: proxy.size.height/3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onReceive(timer, perform: { _ in
                withAnimation{
                    currentIndex = currentIndex <
                        numberOfImages ? currentIndex+1 : 0
                }
            })
        }
    }
}

struct DetailGallerySlideView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGallerySlideView()
    }
}
