//
//  RatingView.swift
//  Sneakerverse
//
//  Created by Dung  on 13.01.21.
//

import SwiftUI

struct RatingView: View {
    var body: some View {
        VStack{
            Text("Ratings")
        List{
            UserRating(username: "user", description: "nice", currentRating: 3)
        }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView()
    }
}
