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
    var time: String
        //leading , trailing
    var body: some View {
        VStack(alignment: isCurrentUser ? .trailing : .leading){
        Text(message)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : DESIGN.COLOR.lightGreyColor)
            .cornerRadius(10)
            
        Text(time)
            .padding(10)
    }
    }
}



struct ChatMessage_Previews: PreviewProvider {
    static var previews: some View {
        ChatMessageView(message: "This is a message", isCurrentUser: false, time: "11.22.2011")

    }
}
