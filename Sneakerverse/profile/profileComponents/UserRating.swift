//
//  UserRating.swift
//  Sneakerverse
//
//  Created by Dung  on 14.01.21.
//

import SwiftUI

struct UserRating: View {
    var username: String
    var description: String
    var message: String?
    var maxRating : Int = 5
    var currentRating: Int
    
    var body: some View {
        HStack {
            HStack {
                Text(username)
                    .font(.system(size: 21, weight: .medium, design: .default))
                VStack{
                    Text(description)
                }
                .padding()
            }
            if((message) != nil){
                Text(message!)
            }
            Spacer()
            HStack{
                ForEach(0 ..< (currentRating)) {_ in
                    Image(uiImage: UIImage(systemName: "star.fill")!)
                        .padding(-5)
                }
                
                ForEach(currentRating ..< maxRating) {_ in
                    Image(uiImage: UIImage(systemName: "star")!)
                        .padding(-5)
                }
            }
            .padding(10)
            
            
            
        }
    }
}

struct UserRating_Previews: PreviewProvider {
    static var previews: some View {
        UserRating(username: "user", description: "cool", currentRating: 3)
    }
}
