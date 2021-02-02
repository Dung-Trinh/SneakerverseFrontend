//
//  CalendarDetailView.swift
//  Sneakerverse
//
//  Created by Dung  on 28.01.21.
//

import SwiftUI
import Kingfisher

struct CalendarDetailView: View {
    var sneaker: SneakerCalendarItem
    
    var body: some View {
        ScrollView{
            KFImage.url(URL(string: sneaker.imageURL))
                .loadDiskFileSynchronously()
                .placeholder{return Image("default-calendar-sneaker")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 200)}
                .cacheMemoryOnly()
                .onProgress { receivedSize, totalSize in  }
                .onSuccess { result in  }
                .onFailure { error in }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200)
            
            Text(sneaker.title)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(sneaker.releaseCalendarDescription)
                .multilineTextAlignment(.center)
                .padding()
            
            VStack{
                HStack{
                    VStack(alignment: .trailing){
                        Text("Preis:").fontWeight(.bold)
                        Text("Spanne").fontWeight(.bold)
                    }
                    .padding(.leading)
                    VStack(alignment: .leading){
                        Text(sneaker.retailPrice + " €")
                        Text(sneaker.priceSpan + " €")
                    }
                    .padding(.trailing)
                    .lineLimit(1)
                    .frame(maxWidth: 200)
                }
                HStack{
                    Image(uiImage: UIImage(systemName: "square.and.arrow.up")!)
                        .resizable()
                        .frame(width:30, height: 30)
                    Image(uiImage: UIImage(systemName: "star.fill")!)
                        .resizable()
                        .frame(width:30, height: 30)
                }
            }.padding()
            
            ForEach(sneaker.imgArray , id: \.self){ img in
                KFImage.url(URL(string: img))
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly()
                    .onProgress { receivedSize, totalSize in  }
                    .onSuccess { result in  }
                    .onFailure { error in }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: .infinity)
            }
        }
    }
}

struct CalendarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarDetailView(sneaker: SneakerCalendarItem(title: "adidas Yeezy Boost 350 V2 Black Red", imageURL: "", retailPrice: "100", priceSpan: "100-200", releaseDate: "11.11.20", imgArray: [], brand: "NIKE", releaseCalendarDescription: "beschreibung", position: ""))
    }
}
