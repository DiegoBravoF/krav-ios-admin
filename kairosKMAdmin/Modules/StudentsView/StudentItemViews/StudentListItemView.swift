//
//  StudentListItemView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 22/12/23.
//

import Alamofire
import SwiftUI

struct StudentListItemView: View {
    @ObservedObject var viewModel: StudentViewModel

    var body: some View {
        HStack(spacing: 60) {
            Text(viewModel.student.fullname)
                .font(.dinRegular(size: 18))
                .frame(width: 360, alignment: .leading)
            Text(viewModel.student.classTime)
                .font(.dinRegular(size: 18))
                .frame(width: 90, alignment: .leading)
            RoundedRectangle(cornerRadius: 6)
                .stroke(.black, lineWidth: 1)
                .foregroundColor(viewModel.student.beltColor)
                .frame(width: 70, height: 12)
            Image(systemName: "eurosign.circle.fill")
                .foregroundColor(.gray)
            Image(systemName: "figure.martial.arts")
                .foregroundColor(.gray)
            Spacer()
            Menu {
                Button {
                    viewModel.newInjuryIsPresented = true
                } label: {
                    Label("Lesión", systemImage: "bandage")
                }
                Button {
                    viewModel.newIssueIsPresented = true
                } label: {
                    Label("Incidencia", systemImage: "light.beacon.min")
                }
                Button {
                    viewModel.profileIsPresented = true
                } label: {
                    Label("Perfil", systemImage: "person")
                }
            } label: {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)

            }
            .frame(width: 32, height: 32)
        }
        .padding()
        .fullScreenCover(isPresented: $viewModel.newIssueIsPresented, content: {
            NewIssueView(viewModel: NewIssueViewModel(viewModel.student), isPresented: $viewModel.newIssueIsPresented)
        })
        .fullScreenCover(isPresented: $viewModel.newInjuryIsPresented, content: {
            NewInjuryView(viewModel: NewInjuryViewModel(viewModel.student), isPresented: $viewModel.newInjuryIsPresented)
        })
        .fullScreenCover(isPresented: $viewModel.profileIsPresented, content: {
            StudentProfileView(viewModel: StudentProfileViewModel(viewModel.student), isPresented: $viewModel.profileIsPresented)
        })
    }
}

struct StudentItemView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListItemView(viewModel: StudentViewModel(Student.preview))
    }
}
