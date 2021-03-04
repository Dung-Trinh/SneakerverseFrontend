//
//  ChatRow.swift
//  Sneakerverse
//
//  Created by Dung  on 23.12.20.
//

import SwiftUI

struct ChatRow: View {
    var username: String
    var sender: String
    var lastMessage: String
    var wasRead: Bool
    
    init(username: String, lastMessages:[ChatMessage]) {
        self.username = username
        if(!lastMessages.isEmpty){
            self.lastMessage = lastMessages.last!.message
            self.wasRead = lastMessages.last!.senderName == username
            self.sender = lastMessages.last!.senderName
        }else{
            self.lastMessage = ""
            self.sender.self = ""
            self.wasRead = true
        }
    }
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
                Text("\(sender == username ? username : "Ich"): \(lastMessage)")
                
            }
            Spacer()
            if !lastMessage.isEmpty {
                if wasRead{
                    Text("🔵")
                }
            }
        }
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(username: "Tester", lastMessages: [ChatMessage(id: "1", senderName: "tester", message: "hallo", chatID: "123", created: "123", v: 1)])
    }
}

