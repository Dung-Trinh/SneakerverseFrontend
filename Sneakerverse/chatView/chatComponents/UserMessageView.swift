//
//  UserMessageView.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import SwiftUI

struct UserMessage {
    var content: String
    var user: UserProfile
}
struct UserProfile {
    var name: String
    var avatar: Image
    var isCurrentUser: Bool
}
struct UserMessageView : View {
    var currentMessage: UserMessage
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if !currentMessage.user.isCurrentUser {
                currentMessage.user.avatar
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            } else {
                Spacer()
            }
            ChatMessageView(message: currentMessage.content,
                            isCurrentUser: currentMessage.user.isCurrentUser)
        }
    }
}

struct UserMessageView_Previews: PreviewProvider {
    static var previews: some View {
        let message = UserMessage (content: "Hello Sneakerlover", user: UserProfile(name: "Dung", avatar: Image(systemName: "person.circle.fill"), isCurrentUser: false))
        UserMessageView(currentMessage: message)
    }
}
