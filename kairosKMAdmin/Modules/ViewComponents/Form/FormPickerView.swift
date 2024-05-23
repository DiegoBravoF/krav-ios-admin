//
//  FormPickerView.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 10/3/24.
//

import SwiftUI

struct FormPickerView: View {
    @Binding var field: FormField

    var body: some View {
        VStack {
            HStack {
                Picker(field.data, selection: $field.data) {
                    Text(field.type.placeholder).tag("")
                    ForEach(field.type.dropDownOptions, id: \.self) {
                        Text($0)
                            .accentColor(.black)
                            .font(.dinRegular(size: 16))
                    }
                }
                .accentColor(.black)
                .font(.dinRegular(size: 16))
                .padding(.leading, -26)
                Spacer()
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .padding(.bottom, 12)
        }
    }
}

#Preview {
    FormPickerView(field: .constant(FormField.preview))
}
