//
//  StudentGridItemView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 15/5/24.
//

import CachedAsyncImage
import SwiftUI

struct StudentGridItemView: View {
    @ObservedObject var viewModel: StudentViewModel

    var body: some View {
        ZStack {
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
                VStack {
                    CachedAsyncImage(url: viewModel.student.pictureUrl) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        default:
                            Image("kairosProfile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        }
                    }
                    Text(viewModel.student.fullname)
                        .font(.dinRegular(size: 18))
                        .foregroundColor(.black)
                        .padding(.top, 4)
                }
            }
        }
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

#Preview {
    StudentGridItemView(viewModel: StudentViewModel(Student.preview))
}
