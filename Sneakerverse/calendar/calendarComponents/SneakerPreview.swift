//
//  SneakerPreview.swift
//  Sneakerverse
//
//  Created by Dung  on 25.01.21.
//

import SwiftUI
import Kingfisher

struct SneakerPreview: View {
    var sneaker: SneakerCalendarItem
    var body: some View {
        NavigationLink(
            destination: CalendarDetailView(sneaker: sneaker)){
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                KFImage.url(URL(string: self.sneaker.imageURL))
                    .loadDiskFileSynchronously()
                    .placeholder{return Image("default-calendar-sneaker")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 200)}
                    .cacheMemoryOnly()
                    .onProgress { receivedSize, totalSize in  }
                    .onSuccess { result in  }
                    .onFailure { error in }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 200)
                
                VStack(alignment: .leading, spacing: 30){
                    Text(sneaker.releaseDate.prefix(2))
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.black)
                        .padding(.top,-80)
                        .padding(.leading,12)
                    
                    Text(sneaker.title)
                        .font(.system(size: 13))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                        .padding(12)
                        .frame(width: 150, height:80)
                }
                
            }
            .shadow(radius: 20 )
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        }
    }
}

//struct SneakerPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        SneakerPreview()
//    }
//}
