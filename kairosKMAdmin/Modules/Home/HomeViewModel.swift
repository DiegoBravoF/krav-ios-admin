//
//  HomeViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 23/4/24.
//

import Foundation

class HomeViewModel: ObservableViewModel {
    var selectedGroup: String = "TUESDAY_18"
    var selectedDay: String = "1713989510570"

    @Published var issues: [Issue] = []
    @Published var students: [Student] = []
    @Published var selectedDate: Date = Date().getOnlyDate() {
        didSet {
            getClasses()
        }
    }
    @Published var classes: [Class] = [] {
        didSet {
            getCheckins()
        }
    }

    override init() {
        super.init()
        getStudents()
    }

    func getIssues() {
        IssuesUseCase.shared.getIssues { issues in
            self.issues = issues
        }
    }

    func getStudents() {
        StudentsUseCase.shared.getStudents { students in
            self.students = students
        }
    }

    func getClasses() {
        guard let weekday = selectedDate.getWeekDay() else { 
            classes = []
            return
        }
        switch weekday {
//        case 2, 4:
//            classes = [Class(id: "1", title: "10.30"), Class(id: "2", title: "18.30"), Class(id: "3", title: "20.00")]
//        case 3, 5:
//            classes = [Class(id: "1", title: "18.30"), Class(id: "2", title: "20.00")]
        default:
            classes = []
        }
    }

    func getCheckins() {
        self.students = []
        CheckinsUseCase.shared.getCheckins(group: selectedGroup, day: selectedDay) { students in
            self.students = students
        }
    }
}
