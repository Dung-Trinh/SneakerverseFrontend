//
//  CreateRatingView.swift
//  Sneakerverse
//
//  Created by Dung  on 29.01.21.
//

import SwiftUI

struct CreateRatingView: View {
    @StateObject var createRatingViewModel = CreateRatingViewModel()
    var targetUser: String
    var maxRating : Int = 5
    
    var body: some View {
        VStack{
            Image("rate_user")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("rate user: \(targetUser)")
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Stepper(value: $createRatingViewModel.rating, in: 1...5) {
                Text("rating")
            }
            HStack{
                ForEach(0 ..< (createRatingViewModel.rating), id: \.self) {_ in
                    Image(uiImage: UIImage(systemName: "star.fill")!)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(-5)
                }
                
                ForEach(createRatingViewModel.rating ..< maxRating, id: \.self) {_ in
                    Image(uiImage: UIImage(systemName: "star")!)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(-5)
                }
                
                
            }.padding()
            
            TextField("Message ...",text: $createRatingViewModel.message)
            Button(action: {
                createRatingViewModel.sendRating(completion: {respose in
                    if respose{
                        print("gesendet")
                    }else{
                        print("failed raitng")
                    }
                    
                })
            }, label: {
                Text("send rating")
            })
        }.padding()
        .onAppear{
            createRatingViewModel.targetUser = targetUser
        }
    }
}

struct CreateRatingView_Previews: PreviewProvider {
    static var previews: some View {
        CreateRatingView(targetUser: "user")
    }
}
