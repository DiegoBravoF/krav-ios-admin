//
//  AssistanceViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 14/5/24.
//

import Foundation

class AssistanceViewModel: ObservableViewModel {
    var selectedGroup: String = "TUESDAY_18"
    var selectedClass: Class = Class(id: "L/X 18.30") {
        didSet {
            getCheckins()
        }
    }
    var selectedStudent: Student? {
        didSet {
            if selectedStudent == nil {
                addAssistanceIsDisabled = false
            }
        }
    }

    @Published var issues: [Issue] = []
    @Published var students: [Student] = [Student.preview, Student.preview1, Student.preview,Student.preview, Student.preview, Student.preview,Student.preview, Student.preview, Student.preview]
    @Published var selectedDate: Date = Date().getOnlyDate() {
        didSet {
            getClasses()
            getCheckins()
        }
    }
    @Published var classes: [Class] = []
    @Published var addAssistanceViewIsPresented: Bool = false
    @Published var addAssistanceIsDisabled: Bool = true

    override init() {
        super.init()
        getClasses()
        getStudents()
    }

    func getStudents() {
//        StudentsUseCase.shared.getStudents { students in
//            self.students = students
//        }
    }

    func getClasses() {
        guard let weekday = selectedDate.getWeekDay() else {
            classes = []
            return
        }
        switch weekday {
        case 2, 4:
            classes = [Class(id: "L/X 10.30"), Class(id: "L/X 18.30"), Class(id: "L/X 20.00")]
        case 3, 5:
            classes = [Class(id: "M/J 18.30"), Class(id: "M/J 20.00")]
        default:
            classes = []
        }
    }

    func getCheckins() {
        self.students = []
        CheckinsUseCase.shared.getCheckins(group: selectedClass.group, day: selectedDate.getTimeInterval()) { students in
            self.students = students
        }
    }

    func submitChekin() {

    }
}
