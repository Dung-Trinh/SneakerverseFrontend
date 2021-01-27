//
//  SneakerPreview.swift
//  Sneakerverse
//
//  Created by Dung  on 25.01.21.
//

import SwiftUI

struct SneakerPreview: View {
    var sneakerName: String
    var date: String
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
            Image("1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 200)
            
            VStack(alignment: .leading, spacing: 30){
                Text(date.prefix(2))
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    .padding(.top,-80)
                    .padding(.leading,12)
                
                Text(sneakerName)
                    .font(.system(size: 13))
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(12)
                    .frame(width: 150, height:80)
            }
            
        }
        .shadow(radius: 20 )
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct SneakerPreview_Previews: PreviewProvider {
    static var previews: some View {
        SneakerPreview(sneakerName: "sneaker name",date: "11.11.2020")
    }
}
