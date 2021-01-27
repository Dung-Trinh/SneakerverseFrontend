//
//  CalendarRow.swift
//  Sneakerverse
//
//  Created by Dung  on 25.01.21.
//

import SwiftUI

struct CalendarRow: View {
    @Binding var sneakerItems: [SneakerCalendarItem]
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(sneakerItems, id: \.self) { item in
                    SneakerPreview(sneakerName: item.title, date: item.releaseDate)
                }
            }
        }
    }
}

struct CalendarRow_Previews: PreviewProvider {
    static var previews: some View {
        CalendarRow(sneakerItems: .constant([]))
    }
}
