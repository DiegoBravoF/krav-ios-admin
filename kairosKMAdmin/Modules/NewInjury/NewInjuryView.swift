//
//  NewInjuryView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 15/5/24.
//

import SwiftUI

struct NewInjuryView: View {
    @ObservedObject var viewModel: NewInjuryViewModel
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                VStack(spacing: 20) {
                    HStack {
                        Spacer()
                        Button(action: {
                            isPresented = false
                        }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                        })
                        .padding(.trailing, 20)
                    }
                    Text("NUEVA LESIÓN")
                        .modifier(Headline())
                        .foregroundColor(.black)
                    HStack {
                        Image(systemName: "cross.case.fill")
                            .frame(width: 36, height: 36)
                            .background(Color.red.opacity(0.4))
                            .foregroundColor(.black)
                            .cornerRadius(18)
                        Text("\(viewModel.form.student.fullname)")
                            .font(.dinRegular(size: 22))
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 20)
                    ForEach($viewModel.form.fields) { field in
                        if !field.wrappedValue.type.hasDropDown {
                            FormFieldView(field: field)
                        } else {
                            FormPickerView(field: field)
                        }
                    }
                    .padding(.horizontal)
                    BottomButtonView(title: "Continuar",
                                     disabled: $viewModel.continueDisabled,
                                     handler: viewModel.submitInjury)
                    .frame(width: 200)
                    .padding(.top, 40)
                }
            }
            .frame(width: 500, height: 500, alignment: .center)
            .foregroundColor(Color.white)
        }
        .presentationBackground(.gray.opacity(0.6))
    }
}

#Preview {
    NewInjuryView(viewModel: NewInjuryViewModel(Student.preview), isPresented: .constant(true))
}
