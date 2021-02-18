//
//  BlogPostListItemView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 28.01.21.
//

import SwiftUI
import Kingfisher

struct BlogPostListItemView: View {
    var blog: Blog
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.red)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 0, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
            VStack{
                KFImage.url(URL(string: self.blog.cover))
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
                    .frame(width: .infinity, height: 180)
                    .scaledToFit()
                HStack{
                    Text(blog.title)
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                        .padding(.leading,20)
                    Spacer()
                }.padding(.bottom,5)
                HStack {
                    Text(blog.blogDescription)
                        .font(.system(size:14))
                        .foregroundColor(Color.black)
                        .padding(.leading,20)
                    Spacer()
                }.padding(.bottom,5)
                HStack {
                    Spacer()
                    Text("weiterlesen")
                        .foregroundColor(Color.black)
                    Image(systemName:"arrow.right.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing,20)
                        
                        .foregroundColor(Color.black)
                }.padding(.bottom,10)
            }
        }.frame(width: .infinity, height: 300)
        .cornerRadius(20)
        .padding(.horizontal,10)
    }
}

struct BlogPostListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BlogPostListItemView(blog: Blog(title: "TestTitle", cover: "", category: "event", blogDescription: "testDescription", contentPictures: [""], shareLink: "", contentVideo: ""))
                .previewLayout(.sizeThatFits)
        }
    }
}
