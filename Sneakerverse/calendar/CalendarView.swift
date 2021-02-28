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
                .padding()
                .foregroundColor(.white)
            
            Picker("calendarFilter", selection: $calendarViewModel.pickerIndex) {
                ForEach(0..<calendarViewModel.categories.count) { index in
                    Text(self.calendarViewModel.categories[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())
            .background(Color(.white).opacity(0.3))
            
            Spacer()
            Text("January")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            if(calendarViewModel.calendarReleaseTop.count > 0){
                CalendarRow(sneakerItems: $calendarViewModel.calendarReleaseTop)
            }else{
                Spacer()
                Text("\"no releases confirmed\"")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            Spacer()
            Text("February")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            if(calendarViewModel.calendarReleaseBottom.count > 0){
                CalendarRow(sneakerItems: $calendarViewModel.calendarReleaseBottom)
            }else{
                Spacer()
                Text("\"no releases confirmed\"")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            Spacer()
        }.background(DESIGN.COLOR.backgroundGradient)
        .onAppear{
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
