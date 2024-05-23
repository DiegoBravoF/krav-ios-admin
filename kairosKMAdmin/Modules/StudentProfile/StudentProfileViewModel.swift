//
//  StudentProfileViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 16/5/24.
//

import Foundation

class StudentProfileViewModel: ObservableViewModel {
    @Published var student: Student

    init(_ student: Student) {
        self.student = student
    }
}
