//
//  MessageView.swift
//  Sneakerverse
//
//  Created by Dung  on 14.12.20.
//

import Foundation
import SwiftUI

struct MessageView: View {
    var currentMessage: Message

    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if !currentMessage.user.isCurrentUser {
              Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .cornerRadius(20)
            }else{
                Spacer()
            }
            
              ChatText(message: "There are a lot of premium iOS templates on iosapptemplates.com",
                       isCurrentUser: currentMessage.user.isCurrentUser)
           }
    }
}

//struct MessageView_Preview: PreviewProvider {
//    static var previews: some View {
////        MessageView()
//    }
//}

