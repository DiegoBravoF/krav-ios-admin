//
//  IssueItemView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 26/12/23.
//

import SwiftUI

struct IssueItemView: View {
    var issue: Issue

    var body: some View {
        HStack {
            Image(systemName: issue.type.icon)
                .frame(width: 36, height: 36)
                .background(issue.type.color)
                .cornerRadius(18)
            VStack(alignment: .leading) {
                Text(issue.student.fullname)
                    .modifier(Subtitle())
                Text(issue.comment)
                    .modifier(Subtitle())
                    .foregroundColor(.gray)
            }
        }
    }
}

struct IssueItemView_Previews: PreviewProvider {
    static var previews: some View {
        IssueItemView(issue: Issue(id: "3",
                                   student: Student(id: "2",
                                                    name: "Verónica",
                                                    surname: "Cordobés Villalvilla", email: "verocordobes@yopmail.com"),
                                   comment: "tobillo torcido",
                                   type: .hard))
    }
}
