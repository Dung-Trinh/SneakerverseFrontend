//
//  RatingView.swift
//  Sneakerverse
//
//  Created by Dung  on 13.01.21.
//

import SwiftUI

struct RatingView: View {
    @Binding var ratings: [Rating]
    
    var body: some View {
        VStack{
            Text("Ratings")
            List{
                ForEach(ratings){ userRating in
                    UserRating(username: userRating.evaluatorName, description: "", currentRating: userRating.rating)
                }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(ratings: .constant([]))
    }
}
