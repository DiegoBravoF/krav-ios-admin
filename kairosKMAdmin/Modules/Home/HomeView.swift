//
//  HomeView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 12/10/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()

    var body: some View {
        HStack(spacing: 32) {
            VStack(spacing: 32) {
//                MonthCalendarView(selectedDate: $viewModel.selectedDate)
//                ClassSelectionView(classes: $viewModel.classes)
//                StudentListView(students: $viewModel.students)
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.white, lineWidth: 2)
                    .frame(height: 260)
            }
            .padding()
            VStack {
                IssueListView()
                InjuryListView()
                PaymentView()
                EquipmentView()
                Spacer()
            }
            .padding(.vertical, 52)
        }
        .onAppear(perform: {
            viewModel.selectedDate = Date().getOnlyDate()
        })
//        .fullScreenCover(isPresented: $viewModel.newIssueIsPresented, content: {
//            NewIssueView(viewModel: NewIssueViewModel(Student.preview))
//        })
        .padding(.top, 60)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
