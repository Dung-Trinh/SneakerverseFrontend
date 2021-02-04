//
//  CalendarViewModel.swift
//  Sneakerverse
//
//  Created by Dung  on 25.01.21.
//

import Foundation
import SwiftUI

class CalendarViewModel: ObservableObject {
    var calenderReleaseDataTop: [SneakerCalendarItem] = []
    var calenderReleaseDataBottom: [SneakerCalendarItem] = []
    @Published var calendarReleaseTop: [SneakerCalendarItem] = []
    @Published var calendarReleaseBottom: [SneakerCalendarItem] = []
    @Published var categories = ["All","Nike", "Adidas", "Puma"]
    @Published var pickerIndex = 0{
        didSet {
            self.filterReleases(index: pickerIndex)
        }
    }
    
    var calendarService = CalendarService()
    
    func getCalendarItems(calendarRow: String, completion: @escaping  (Bool)->Void){
        calendarService.fetchCalendarItems(row: calendarRow, completion: { response in
            switch response{
            case .success(let newCalendarItems):
                if(calendarRow == "1"){
                    self.calenderReleaseDataTop = newCalendarItems
                    self.calendarReleaseBottom = newCalendarItems
                }else{
                    self.calenderReleaseDataBottom = newCalendarItems
                    self.calendarReleaseTop = newCalendarItems
                }
                completion(true)
            case .failure(_):
                completion(false)
            }
        })
    }
    
    func filterReleases(index: Int){
        if(index == 0){
            calendarReleaseTop = calenderReleaseDataTop
            calendarReleaseBottom = calenderReleaseDataBottom
        }else{
            calendarReleaseTop = calenderReleaseDataTop.filter{$0.brand == categories[pickerIndex]}
            calendarReleaseBottom = calenderReleaseDataBottom.filter{$0.brand == categories[pickerIndex]}
        }
        
    }
}
