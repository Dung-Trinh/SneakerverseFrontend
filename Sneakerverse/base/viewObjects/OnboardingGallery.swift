//
//  OnboardingGallery.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 20.11.20.
//

import SwiftUI

struct OnboardingGallery: View {
    @State private var currentIndex = 0
    
    private var numberOfImages = 5
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader{ proxy in
            TabView(selection:$currentIndex){
                ForEach(0..<numberOfImages){ num in
                    Image("\(num)")
                        .resizable()
                        .scaledToFit()
                        .overlay(Color.black.opacity(0.4))
                        .tag(num)
                }
            }.tabViewStyle(PageTabViewStyle())
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding()
            .frame(width: proxy.size.width, height: proxy.size.height )
            .onReceive(timer, perform: { _ in
                withAnimation{
                    currentIndex = currentIndex <
                        numberOfImages ? currentIndex+1 : 0
                }
            })
        }
    }
}

struct OnboardingGallery_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingGallery()
    }
}
