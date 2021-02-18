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
                .cornerRadius(20)
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            VStack{
                KFImage.url(URL(string: self.blog.contentPictures[0]))
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
                HStack{
                    Text(blog.title)
                    Spacer()
                }
                HStack {
                    Text(blog.blogDescription)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Text("weiterlesen")
                }
            }
        }.frame(width: 600, height: 200)
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
