//
//  DetailGallerySlideView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 08.01.21.
//

import SwiftUI

struct DetailGallerySlideView: View {
    var imageList: [UIImage] = []
    private var numberOFImages = 5
    var body: some View {
        GeometryReader{ proxy in
            TabView{
                ForEach(0..<numberOFImages){
                    num in
                    Image("\(num)")
                        .resizable()
                        .scaledToFill()
                        .tag(num)
                }
            }.tabViewStyle(PageTabViewStyle())
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding()
            .frame(width: proxy.size.width, height: proxy.size.height/3, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct DetailGallerySlideView_Previews: PreviewProvider {
    static var previews: some View {
        DetailGallerySlideView()
    }
}
