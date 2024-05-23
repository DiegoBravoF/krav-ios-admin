//
//  StudentListView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 22/12/23.
//

import SwiftUI

struct StudentListView: View {
    @Binding var students: [Student]

    var body: some View {
        VStack {
            ZStack {
                Text("ASISTENCIA")
                HStack {
                    Spacer()
                    Button {
                        print("Añadir alumno")
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .accentColor(.black)
                    }
                    .padding()
                }
            }
            List(students) { student in
                StudentListItemView(viewModel: StudentViewModel(student))
            }
            .listStyle(.plain)
        }
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView(students: .constant([]))
    }
}
