//
//  MonthCalendarView.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 13/12/23.
//

import SwiftUI

struct MonthCalendarView: View {
//    @State var tabBarHidden: Visibility = .visible
//    @StateObject var viewModel = CalendarViewModel()

    @State var currentDate: Date = Date()
    @State var currentMonth: Int = 0
    @Binding var selectedDate: Date
//    @State var selectedEvent: Event?
    
    var calendar = KairosCalendar.shared.calendar

    let days: [String] = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"]
    var body: some View {
//        ScrollView {
            VStack {
//                HStack {
//                HeaderView(title: "CALENDARIO")
                VStack(spacing: 10) {
                    // Month/Year Header view
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(getStringDate()[0])
//                                .font(.dinBold(size: 14))
                            Text(getStringDate()[1])
//                                .font(.dinBold(size: 18))
                        }
                        Spacer()
                        Button {
                            //                    withAnimation {
                            currentMonth -= 1
//                            selectedEvent = nil
                            //                    }
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                        Button {
                            //                    withAnimation {
                            currentMonth += 1
//                            selectedEvent = nil
                            //                    }
                        } label: {
                            Image(systemName: "chevron.right")
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)

                    // Day Header View
                    HStack(spacing: 0) {
                        ForEach(days, id: \.self) { day in
                            Text(day)
//                                .font(.dinBold(size: 16))
                                .frame(maxWidth: .infinity)
                        }
                    }
                    
                    // Days
                    let columns = Array(repeating: GridItem(.flexible()), count: 7)
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(extractDate()) { value in
                            cardView(value: value)
                        }
                    }
                }
                .onChange(of: currentMonth) { newValue in
                    currentDate = getCurrentMonth()
                }
                .padding(.horizontal, 0)
                HStack(alignment: .center, spacing: 8) {
                    //                Circle()
                    //                    .frame(width: 6, height: 6, alignment: .leading)
                    //                    .foregroundColor(.gray)
                    //                Text("Espinilleras")
                    //                    .font(.dinRegular(size: 13))
                    //                    .foregroundColor(.gray)
                    Spacer()
                }
                .frame(height: 20, alignment: .leading)
                .padding(.horizontal, 20)
//                .padding(.vertical, 4)
//                if let event = selectedEvent {
//                    NavigationLink {
//                        EventDetailView(event: event)
//                            .onAppear {
//                                tabBarHidden = .hidden
//                            }
//                    } label: {
//                        EventCaptionView(event: event)
//                    }
//                }
//                Spacer()
//            }
        }
    }

    @ViewBuilder
    func cardView(value: DateValue) -> some View {
//        VStack{
            if value.day != -1 {
                //                if let appointedDay = getAppointedDay(value.date) {
                //                    EventDayView(appointedDay: appointedDay, day: value.day) {
                //                        selectedEvent = appointedDay
                //                    }
                //                    .padding(.bottom, -6)
                //                } else {
                Button {
                    selectedDate = value.date
                } label: {
                    if value.date == selectedDate {
                        Text("\(value.day)")
                            .bold()
                            .frame(width: 22, height: 22)
                            .accentColor(.black)
                    } else {
                        Text("\(value.day)")
                            .frame(width: 22, height: 22)
                            .accentColor(.black)
                    }
                            
//                }
                
            }
            //            }
            } else {
                Text("")
            }
//        .background()
    }

    func getStringDate() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }

    func getCurrentMonth() -> Date {
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }

    func extractDate() -> [DateValue] {
        var days = getCurrentMonth().getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }

        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())

        for _ in 0..<firstWeekDay - 2 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }

//    func extractEventsDates() -> [Date] {
//        viewModel.events.map({ $0.startDate })
//    }

//    func getAppointedDay(_ date: Date) -> Event? {
//        let appointedDay: Event? = viewModel.events.first(where: {
//            return $0.startDateOnlyDate == date
//        })
//        return appointedDay
//    }
}

struct MonthCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        MonthCalendarView(selectedDate: .constant(Date()))
    }
}
