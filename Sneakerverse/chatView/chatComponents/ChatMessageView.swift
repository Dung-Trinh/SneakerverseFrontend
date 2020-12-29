//
//  ChatMessage.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import SwiftUI


struct ChatMessageView: View {
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



struct ChatMessage_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(message: "This is a message", isCurrentUser: false)

    }
}
