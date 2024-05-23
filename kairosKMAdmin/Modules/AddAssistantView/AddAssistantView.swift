//
//  AddAssistantView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 16/5/24.
//

import SwiftUI
import UIKit

struct AddAssistantView: View {
    @ObservedObject var viewModel: AssistanceViewModel
    @State private var searchText = ""

    init(viewModel: AssistanceViewModel) {
        self.viewModel = viewModel
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
         UINavigationBar.appearance().standardAppearance = navBarAppearance
    }

    var body: some View {
        ZStack {
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
//                VStack {
                    VStack(spacing: 18) {
                        HStack {
                            Spacer()
                            Button(action: {
                                viewModel.addAssistanceViewIsPresented = false
                            }, label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.black)
                            })
                        }
                        HStack(alignment: .center, spacing: 10) {
                            Text("FECHA")
                                .font(.dinBold(size: 18))
                                .foregroundColor(.black)
                            DatePicker("Fecha", selection: $viewModel.selectedDate, displayedComponents: [.date])
                                .fixedSize()
                            Spacer()
                        }
                        .frame(height: 20)
                        HStack {
                            Text("HORARIO")
                                .font(.dinBold(size: 18))
                                .foregroundColor(.black)
                            if !$viewModel.classes.isEmpty {
                                Picker("Class", selection: $viewModel.selectedClass) {
                                    ForEach($viewModel.classes, id: \.self) { classItem in
                                        Text(classItem.id).tag(classItem.id)
                                    }
                                }
                                .accentColor(.black)
                                .pickerStyle(.automatic)
                            }
                            Spacer()
                        }
                        .frame(height: 40)
                    NavigationStack {
                            List {
                                ForEach(searchResults, id: \.self) { student in
                                    HStack {
                                        Text(student.fullname)
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    .onTapGesture {
                                        viewModel.selectedStudent = student
                                    }
                                }
                            }
                            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                            .listStyle(.inset)
                            .background(.white)
                        }

                        BottomButtonView(title: "Añadir asistente", disabled: $viewModel.addAssistanceIsDisabled) {

                        }
                        .padding(.top)
                        .padding(.horizontal, 60)
                    }
                    .padding(.all, 40)
//                }
            }
            .frame(width: 500, height: 700, alignment: .center)
            .foregroundColor(Color.white)
        }
        .presentationBackground(.gray.opacity(0.6))
    }

    var searchResults: [Student] {
        if searchText.isEmpty {
            return viewModel.students
        } else {
            return viewModel.students.filter { $0.fullname.contains(searchText) }
        }
    }
}


#Preview {
    AddAssistantView(viewModel: AssistanceViewModel())
}
