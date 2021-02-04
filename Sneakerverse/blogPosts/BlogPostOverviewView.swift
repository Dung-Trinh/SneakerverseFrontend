//
//  BlogPostOverviewView.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 28.01.21.
//

import SwiftUI

struct BlogPostOverviewView: View {
    @State var viewModel: BlogPostOverviewViewmodel = BlogPostOverviewViewmodel()
    @State var blogPostList: [Blog] = []
    let BlogPost = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView{
            LazyVGrid(columns: BlogPost, spacing:20){
                ForEach(blogPostList, id: \.self){ blogPost in
                    NavigationLink(
                        destination: BlogPostDetailView(blogPost: blogPost)){
                        BlogPostListItemView(blog: blogPost)
                    }
                }
            }
        } .onAppear(perform: {
            viewModel.fetchBlogPosts(){ fetchedBlogPosts in
                self.blogPostList = fetchedBlogPosts
            }
        })
    }
}

struct BlogPostOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        BlogPostOverviewView()
    }
}
