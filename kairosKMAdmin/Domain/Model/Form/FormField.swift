//
//  FormField.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 28/9/23.
//

import Foundation
import SwiftUI

class FormField: Identifiable {
    static var preview: FormField {
        FormField(type: .name, data: "")
    }

    static var previewMultiple: FormField {
        FormField(type: .kmInterest, data: "")
    }

    static var prefixPreview: FormField {
        FormField(type: .prefix, data: "")
    }

    static var phonePreview: FormField {
        FormField(type: .phone, data: "")
    }

    static var optionPreview: FormField {
        FormField(type: .kmInterest, data: "")
    }

    var id = UUID()
    var type: FieldType
    @Published var date: Date = Date()
    @Published var data: String = ""

    init(id: UUID = UUID(), type: FieldType, data: String = "", date: Date = Date()) {
        self.id = id
        self.type = type
        self.data = data
        self.date = date
    }

    func appendOption(_ option: String) {
        data += "," + option
    }

    func removeOption(_ option: String) {
        data = data.replacingOccurrences(of: ("," + option), with: "")
    }
}
