//
//  KairosCalendar.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 21/10/23.
//

import Foundation

struct KairosCalendar {
    static let shared = KairosCalendar()

    var calendar = Calendar.current

    init() {
        calendar.firstWeekday = 2
        calendar.timeZone = TimeZone(identifier: "UTC")!
    }
}
