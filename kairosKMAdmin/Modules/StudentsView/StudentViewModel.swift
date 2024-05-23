//
//  StudentViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 15/5/24.
//

import Foundation

class StudentViewModel: ObservableViewModel {
    @Published var student: Student
    @Published var newIssueIsPresented: Bool = false
    @Published var newInjuryIsPresented: Bool = false
    @Published var profileIsPresented: Bool = false

    init(_ student: Student) {
        self.student = student
    }
}
