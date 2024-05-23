//
//  FormFieldView.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 27/9/23.
//

import SwiftUI

struct FormFieldView: View {
    @Binding var field: FormField

    @State var input: String = ""
    @State var editing: Bool = false
    @State var validates: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(editing || !field.data.isEmpty ? field.type.title : "")
                .padding(.bottom, -2)
                .font(.dinRegular(size: 16))
                .foregroundColor(editing ? .black : .gray)
            TextField(editing ? "" : field.type.title, text: $field.data) { isEditing in
                editing = isEditing
            }
            .font(.dinRegular(size: 16))
            .foregroundColor(field.type.isDisabled ? .gray : .black)
            .textInputAutocapitalization(field.type.capitalization)
            .autocorrectionDisabled(field.type.autocorrectionDisabled)
            .disabled(field.type.isDisabled)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(editing ? .black : .gray)
            Text(field.type.error)
                .foregroundColor(.red)
                .font(.dinRegular(size: 12))
        }
    }
}

struct FormFieldView_Previews: PreviewProvider {
    static var previews: some View {
        FormFieldView(field: .constant(FormField.preview))
    }
}
