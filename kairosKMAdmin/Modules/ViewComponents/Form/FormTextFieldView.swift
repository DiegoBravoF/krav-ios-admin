//
//  FormTextFieldView.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 10/3/24.
//

import SwiftUI

struct FormTextFieldView: View {
    @Binding var field: FormField
    var disabled: Bool = false

    @Binding var editing: Bool
    @Binding var initialized: Bool
    @Binding var validates: Bool
    @State var selectedOption: String = ""

    var body: some View {
        TextField(field.data, text: $field.data) { isEditing in
            editing = isEditing
            initialized = true
            validates = validateText()
        }
        .keyboardType(field.type.keyboardType)
        .font(.dinRegular(size: 16))
        .foregroundColor(disabled ? .gray : .black)
        .textInputAutocapitalization(field.type.capitalization)
        .autocorrectionDisabled(field.type.autocorrectionDisabled)
        .padding(.leading, 20)
        .onChange(of: field.data) { newValue in
            validates = validateText()
        }
    }

    func validateText() -> Bool {
        let regex = try! NSRegularExpression(pattern: field.type.regex, options: [])
        let range = NSRange(location: 0, length: field.data.count)
        let matchRange = regex.rangeOfFirstMatch(in: field.data, options: .reportProgress, range: range)
        let valid = matchRange.location != NSNotFound
        return valid
    }
}

#Preview {
    FormTextFieldView(field: .constant( FormField.preview), editing: .constant(false), initialized: .constant(true), validates: .constant(true))
}
