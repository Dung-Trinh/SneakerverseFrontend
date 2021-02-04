//
//  BlogPostDetailView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 04.02.21.
//

import SwiftUI

struct BlogPostDetailView: View {
    @State var viewModel: BlogPostDetailViewModel = BlogPostDetailViewModel()
    @State var blogPost: Blog
    var body: some View {
        VStack{
            Image("default-sneaker")
            HStack{
                Text(blogPost.title)
                Spacer()
            }
            HStack{
                Text(blogPost.blogDescription)
            }
        }
    }
}

struct BlogPostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BlogPostDetailView(blogPost: Blog(title: "BlogPostTitle", cover: "", category: "Event", blogDescription: "BlogpostDescription", contentPictures: [""], shareLink: "", contentVideo: ""))
    }
}
