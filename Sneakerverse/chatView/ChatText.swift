//
//  ChatText.swift
//  Sneakerverse
//
//  Created by Dung  on 14.12.20.
//

import SwiftUI

struct ChatText: View {
    var message: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(message)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : DESIGN.COLOR.lightGreyColor)
            .cornerRadius(10)
    }
}



struct ChatText_Previews: PreviewProvider {
    static var previews: some View {
        ChatText(message: "Hi, I am your friend", isCurrentUser: false)

    }
}
