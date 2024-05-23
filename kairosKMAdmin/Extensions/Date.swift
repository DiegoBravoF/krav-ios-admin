//
//  Date.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 20/10/23.
//

import Foundation

extension Date {
    func getAllDates() -> [Date] {
        let calendar = KairosCalendar.shared.calendar
    
        let startDate = calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!

        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }

    func getDates(endDate: Date) -> [Date] {
        let calendar = KairosCalendar.shared.calendar
        var date = self
//        var dates: [Date] = [calendar.date(from: calendar.dateComponents([.year, .month, .day], from: date))!]
        var dates: [Date] = []
    
        while date <= endDate {
            date = calendar.date(byAdding: .day, value: 1, to: date)!
            dates.append(calendar.date(from: calendar.dateComponents([.year, .month, .day], from: date))!)
        }
        return dates
    }

    func getOnlyDate() -> Date {
        let calendar = KairosCalendar.shared.calendar
    
        let date = calendar.date(from: calendar.dateComponents([.year, .month, .day], from: self))!

        return date
    }

    func birthDateToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: self)
    }

    func getCaptionDateString(_ endDate: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.timeZone = TimeZone(secondsFromGMT: -3600)
        formatter.dateFormat = "EEE. dd/MM, HH:mm"
        var timeTxt = formatter.string(from: self)
//        if self.getOnlyDate() == endDate.getOnlyDate() {
//            formatter.dateFormat = "HH:mm"
//            let endTime = formatter.string(from: endDate)
//            timeTxt = timeTxt + ("-") + endTime
//        }
        return timeTxt
    }

    func getEnrolDate() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_ES")
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }

    func getWeekDay() -> Int? {
        let calendar = KairosCalendar.shared.calendar
        return calendar.dateComponents([.weekday], from: self).weekday
    }

    func getTimeInterval() -> String {
        "\(Int(self.timeIntervalSince1970))"
    }
}
