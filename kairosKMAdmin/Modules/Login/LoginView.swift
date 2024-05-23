//
//  LoginView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 30/4/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("INICIAR SESIÓN")
                    .modifier(Title())
                    .padding(.top, 140)
                    .padding(.vertical, 20)
                VStack {
                    ForEach($viewModel.form.fields) { field in
                        FormFieldView(field: field)
                    }
                }
                .frame(maxWidth: 300)
                Button(action: {
                    viewModel.login()
                }, label: {
                    Text("Iniciar sesión")
                        .modifier(RegularUnderlined())
                        .foregroundColor(.black)
                })
                .padding(.top, 42)
                Spacer()
            }
            .padding(.horizontal, 24)
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text(viewModel.alertTitle),
                      message: Text(viewModel.alertText),
                      dismissButton: .cancel(Text("De acuerdo"), action: {
                    viewModel.showAlert = false
                }))
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
