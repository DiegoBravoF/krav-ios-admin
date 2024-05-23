//
//  StudentProfileView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 16/5/24.
//

import SwiftUI
import CachedAsyncImage

struct StudentProfileView: View {
    @ObservedObject var viewModel: StudentProfileViewModel
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
                        .modifier(Headline())
                        .foregroundColor(.black)
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(.black, lineWidth: 1)
                        .foregroundColor(viewModel.student.beltColor)
                        .frame(width: 70, height: 12)
                    Text(viewModel.student.email)
                        .foregroundColor(.black)
                    Text(viewModel.student.phone ?? "")
                        .foregroundColor(.black)
                    Text(viewModel.student.group ?? "")
                        .foregroundColor(.black)
                    Text(viewModel.student.classTime)
                        .foregroundColor(.black)
                }
            }
            .frame(width: 500, height: 500, alignment: .center)
            .foregroundColor(Color.white)
        }
        .presentationBackground(.gray.opacity(0.6))
    }
}

#Preview {
    StudentProfileView(viewModel: StudentProfileViewModel(Student.preview), isPresented: .constant(true))
}
