//
//  BlogPostDetailView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 04.02.21.
//

import SwiftUI
import AVKit

struct BlogPostDetailView: View {
    @State var viewModel: BlogPostDetailViewModel = BlogPostDetailViewModel()
    @State var blogPost: Blog
    var body: some View {
        VStack{
            DetailGallerySlideView(imageList: blogPost.contentPictures)
                .frame(width: .infinity, height: 250)
                .padding(.bottom,10)
            HStack{
                Text(blogPost.title)
                    .foregroundColor(DESIGN.COLOR.darkPurple)
                    .font(.system(size:20))
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading,10)
            .padding(.bottom,20)
            HStack{
                Text(blogPost.blogDescription)
                    .font(.system(size:14))
            }.padding(.horizontal,10)
            HStack{
                Image(uiImage: UIImage(systemName: "square.and.arrow.up")!)
                    .resizable()
                    .frame(width:30, height: 33)
                Image(uiImage: UIImage(systemName: "calendar.badge.plus")!)
                    .resizable()
                    .frame(width:30, height: 30)
                Image(uiImage: UIImage(systemName: "star.fill")!)
                    .resizable()
                    .frame(width:30, height: 30)
                
            }
            VideoPlayer(player: AVPlayer(url: URL(string: blogPost.contentVideo)!))
                .padding(.horizontal,10)
        }
    }
}

struct BlogPostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BlogPostDetailView(blogPost: Blog(title: "BlogPostTitle", cover: "", category: "Event", blogDescription: "BlogpostDescription", contentPictures: [""], shareLink: "", contentVideo: ""))
    }
}
