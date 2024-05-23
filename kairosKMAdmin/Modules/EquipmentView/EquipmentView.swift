//
//  EquipmentView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 27/12/23.
//

import SwiftUI

struct EquipmentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(lineWidth: 2)
                .frame(width: 280, height: 42)
            Button(action: {
                print("Equipment")
            }, label: {
                Text("Compra de Material")
                    .font(.title2)
                    .accentColor(.black)
            })
            .frame(width: 280, height: 42)
            .padding()
        }
    }
}

#Preview {
    EquipmentView()
}
