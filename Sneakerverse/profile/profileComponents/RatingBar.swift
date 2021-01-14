//
//  RatingBar.swift
//  Sneakerverse
//
//  Created by Dung  on 13.01.21.
//

import SwiftUI

struct RatingBar: View {
    var currentRating: Int
    var ratingAmount: Int
    let maxRating = 5
    
    var body: some View {
        NavigationLink(destination: RatingView()) {
            HStack{
                ForEach(0 ..< (maxRating-currentRating)+1) {_ in
                    Image(uiImage: UIImage(systemName: "star.fill")!)
                        .padding(-5)
                }
                
                ForEach(currentRating ..< maxRating) {_ in
                    Image(uiImage: UIImage(systemName: "star")!)
                        .padding(-5)
                }
                Text("(\(ratingAmount))")
            }
        }
        
    }
}

struct RatingBar_Previews: PreviewProvider {
    static var previews: some View {
        RatingBar(currentRating: 3, ratingAmount: 3)
    }
}
