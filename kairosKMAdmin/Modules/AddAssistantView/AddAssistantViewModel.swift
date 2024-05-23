//
//  AddAssistantViewModel.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 16/5/24.
//

import Foundation

class AddAssistantViewModel: ObservableViewModel {
    @Published var students: [Student]
    @Published var selectedDate: Date = Date().getOnlyDate()

    init(_ students: [Student]) {
        self.students = students
    }
}
