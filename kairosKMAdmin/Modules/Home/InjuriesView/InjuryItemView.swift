//
//  InjuryItemView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 11/5/24.
//

import SwiftUI

struct InjuryItemView: View {
    var injury: Injury

    var body: some View {
        HStack {
            Image(systemName: injury.type.icon)
                .frame(width: 36, height: 36)
                .background(injury.type.color)
                .cornerRadius(18)
            VStack(alignment: .leading) {
                Text(injury.student.fullname)
                    .modifier(Subtitle())
                Text(injury.comment)
                    .modifier(Subtitle())
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    InjuryItemView(injury: Injury(id: "3",
                            student: Student(id: "2",
                                             name: "Verónica",
                                             surname: "Cordobés Villalvilla", email: "verocordobes@yopmail.com"),
                            comment: "tobillo torcido",
                            type: .mild))
}
