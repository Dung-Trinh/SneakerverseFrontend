//
//  BlogPostOverviewViewmodel.swift
//  Sneakerverse
//
//  Created by Hoang Ha Vu on 28.01.21.
//

import Foundation

class BlogPostOverviewViewmodel: ObservableObject{
    var blogPostService = BlogPostService()
    
    func fetchBlogPosts(completion: @escaping ([Blog])->Void){
        blogPostService.getAllBlogPosts(completion: { response in
            switch response{
            case .success(let blogPostList):
                completion(blogPostList)
            case .failure:
                print("fetch BlogPost failed")
                completion([])
            }
        })
    }
}
