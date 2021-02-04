//
//  CalendarView.swift
//  Sneakerverse
//
//  Created by Dung  on 25.01.21.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var calendarViewModel = CalendarViewModel()
    
    var body: some View {
        VStack{
            Text("Releases")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Picker("calendarFilter", selection: $calendarViewModel.pickerIndex) {
                ForEach(0..<calendarViewModel.categories.count) { index in
                    Text(self.calendarViewModel.categories[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            
            Spacer()
            Text("Month: January")
                .font(.headline)
            CalendarRow(sneakerItems: $calendarViewModel.calendarReleaseTop)
            Spacer()
            Text("Month: January")
                .font(.headline)
            CalendarRow(sneakerItems: $calendarViewModel.calendarReleaseBottom)
            Spacer()
        }.onAppear{
            calendarViewModel.getCalendarItems(calendarRow: "1", completion: {_ in})
            calendarViewModel.getCalendarItems(calendarRow: "2", completion: {_ in})
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
