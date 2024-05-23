//
//  LoadingView.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 30/4/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .opacity(0.25)
                .ignoresSafeArea()
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(2)
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
        }
    }
}

#Preview {
    LoadingView()
}
