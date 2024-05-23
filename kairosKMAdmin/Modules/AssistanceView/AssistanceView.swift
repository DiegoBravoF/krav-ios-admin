//
//  AssistanceView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 11/1/24.
//

import SwiftUI

struct AssistanceView: View {
    enum ListView: CaseIterable {
        case list
        case grid

        var image: String {
            switch self {
            case .list:
                return "list.bullet"
            case .grid:
                return "square.grid.2x2"
            }
        }
    }
    @ObservedObject var viewModel = AssistanceViewModel()
    @State private var selectedListView: ListView? = .list

    var body: some View {
        VStack {
            VStack(spacing: 18) {
                HStack(alignment: .center, spacing: 10) {
                    Text("FECHA")
                        .font(.dinBold(size: 24))
                    DatePicker("Fecha", selection: $viewModel.selectedDate, displayedComponents: [.date])
                        .fixedSize()
                    Spacer()
                }
                .frame(height: 40)
                HStack {
                    Text("HORARIO")
                        .font(.dinBold(size: 24))
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
                HStack {
                    Text("ASISTENTES")
                        .font(.dinBold(size: 24))
                    Spacer()
                    ForEach(ListView.allCases, id: \.self) { listView in
                        Button {
                            selectedListView = listView
                        } label: {
                            Image(systemName: listView.image)
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(selectedListView == listView ? .black : .gray)
                        }
                        .padding(.leading, 20)
                    }

                    Spacer()
                    BottomButtonView(title: "Añadir asistente", disabled: .constant(false)) {
                        viewModel.addAssistanceViewIsPresented = true
                    }
                    .frame(width: 300)
                }
                .frame(height: 40)
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
                .padding(.vertical)
            if viewModel.students.isEmpty {
                HStack {
                    Image(systemName: "person.2")
                        .resizable()
                        .frame(width: 50, height: 34)
                    Text("Aún no hay asistentes")
                        .font(.dinRegular(size: 24))
                }
                .padding(.top, 100)
            } else if selectedListView == .grid {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3)) {
                    ForEach(viewModel.students) { student in
                        StudentGridItemView(viewModel: StudentViewModel(student))
                    }
                }
            } else {
                List(viewModel.students) { student in
                    StudentListItemView(viewModel: StudentViewModel(student))
                }
                .listStyle(.plain)
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $viewModel.addAssistanceViewIsPresented) {
            AddAssistantView(viewModel: viewModel)
        }
    }
}

#Preview {
    AssistanceView()
}
