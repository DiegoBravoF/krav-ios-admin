//
//  SplashView.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 3/3/23.
//

import SwiftUI

struct SplashView: View {
    @State var isActive = false
    @State var hasToken = false
    @ObservedObject var user = User.shared

    var body: some View {
        if isActive && !user.notLoggedIn {
            TabbarView()
        } else if isActive && user.notLoggedIn {
            LoginView()
        } else {
            ZStack {
                Color(.black)
                    .ignoresSafeArea()
                VStack(spacing: -20) {
                    Image("Logo")
                    Image("Signature")
                        .padding(.leading, 220)
                        .padding(.top)
                }
                .padding(.top, -60)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                    for family in UIFont.familyNames.sorted() {
//                        let names = UIFont.fontNames(forFamilyName: family)
//                        print("Family: \(family) Font names: \(names)")
//                    }
                    isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
