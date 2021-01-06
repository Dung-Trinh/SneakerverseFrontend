//
//  ChatRow.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import SwiftUI

struct ChatRow: View {
    var username: String
    var lastMessage: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(50)
            VStack(alignment: .leading) {
                Text(username)
                    .font(.system(size: 21, weight: .medium, design: .default))
                Text(lastMessage)
            }
        }
    }
}

//struct ChatRow_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
