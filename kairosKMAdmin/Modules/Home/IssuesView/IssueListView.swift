//
//  IssueView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 26/12/23.
//

import SwiftUI

struct IssueListView: View {
    
    var issues: [Issue] = [Issue(id: "5",
                                 student: Student(id: "2",
                                                  name: "Verónica",
                                                  surname: "Cordobés Villalvilla", email: "verocordobes@yopmail.com"),
                                 comment: "falta de respeto",
                                 type: .discipline),
                           Issue(id: "9",
                                 student: Student(id: "2",
                                                  name: "Verónica",
                                                  surname: "Cordobés Villalvilla", email: "verocordobes@yopmail.com"),
                                 comment: "Hace daño al compañero",
                                 type: .hard),
                           Issue(id: "8",
                                 student: Student(id: "2",
                                                  name: "Verónica",
                                                  surname: "Cordobés Villalvilla", email: "verocordobes@yopmail.com"),
                                 comment: "",
                                 type: .uniform)
    ]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray, lineWidth: 2)
                .frame(height: 260)
            VStack {
                VStack(alignment: .leading) {
                    ZStack {
                        Text("INCIDENCIAS")
                        HStack {
                            Spacer()
                            Button {
                                print("Añadir alumno")
                            } label: {
//                                Image(systemName: "plus.circle")
//                                    .resizable()
//                                    .frame(width: 28, height: 28)
//                                    .accentColor(.black)
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                    ForEach(issues[0..<3]) { issue in
                        IssueItemView(issue: issue)
                            .padding(.top, 10)
                    }
                    .padding(.leading, 40)
                }
                Button {
                    print("Ver más")
                } label: {
                    Text("Ver más")
                        .accentColor(.black)
                }
                .padding(.top, 10)
            }
            .padding(.vertical, 30)
        }
        .padding(.horizontal, 60)
    }
}

struct IssueListView_Previews: PreviewProvider {
    static var previews: some View {
        IssueListView()
    }
}
