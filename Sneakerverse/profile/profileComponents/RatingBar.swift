//
//  RatingBar.swift
//  Sneakerverse
//
//  Created by Dung  on 13.01.21.
//

import SwiftUI

struct RatingBar: View {
    @Binding var userRating: [Rating]
    var currentRating: Int
    var ratingAmount: Int
    
    let maxRating = 5
    
    init(userRating: Binding<[Rating]>) {
        self._userRating = userRating
        self.ratingAmount = userRating.wrappedValue.count
        var averageRating: Double = 0
        for i in userRating.wrappedValue {
            averageRating += Double(i.rating)
        }
        
        averageRating = averageRating / Double(self.ratingAmount)
        self.currentRating = Int(round(averageRating))
    }
    
    var body: some View {
        NavigationLink(destination: RatingView(ratings: $userRating)) {
            HStack{
                ForEach(0 ..< (currentRating)) {_ in
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

//struct RatingBar_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingBar(currentRating: 3, ratingAmount: 3)
//    }
//}
