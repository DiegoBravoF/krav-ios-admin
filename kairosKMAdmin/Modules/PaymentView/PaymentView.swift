//
//  PaymentView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 26/12/23.
//

import SwiftUI

struct PaymentView: View {
    var body: some View {
        Button {
            print("PAYMENT")
        } label: {
            Text("Añadir pago")
                .font(.title2)
                .accentColor(.white)
        }
        .frame(width: 180, height: 42)
        .background(Color.black)
        .cornerRadius(12)
        .padding()
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
