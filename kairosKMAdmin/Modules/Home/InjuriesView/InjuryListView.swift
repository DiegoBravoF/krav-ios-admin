//
//  InjuryListView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 11/5/24.
//

import SwiftUI

struct InjuryListView: View {
    var injuries: [Injury] = [Injury(id: "3",
                                 student: Student(id: "2",
                                                  name: "Verónica",
                                                  surname: "Cordobés Villalvilla", email: "verocordobes@yopmail.com"),
                                 comment: "tobillo torcido",
                                   type: .mild),
                           Injury(id: "9",
                                 student: Student(id: "2",
                                                  name: "Verónica",
                                                  surname: "Cordobés Villalvilla", email: "verocordobes@yopmail.com"),
                                 comment: "herida abierta en pie",
                                 type: .other),
                           Injury(id: "5",
                                 student: Student(id: "2",
                                                  name: "Verónica",
                                                  surname: "Cordobés Villalvilla", email: "verocordobes@yopmail.com"),
                                 comment: "esguince de muñeca",
                                  type: .severe)
                           ]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray, lineWidth: 2)
                .frame(height: 260)
            VStack {
                VStack(alignment: .leading) {
                    ZStack {
                        Text("LESIONES")
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
                    ForEach(injuries[0..<3]) { injury in
                        InjuryItemView(injury: injury)
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

#Preview {
    InjuryListView()
}
