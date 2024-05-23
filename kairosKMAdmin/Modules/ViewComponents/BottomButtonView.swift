//
//  BottomButtonView.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 27/9/23.
//

import SwiftUI

struct BottomButtonView: View {
    var title: String = "Continuar"
    @Binding var disabled: Bool

    let disabledColor: Color = .gray
    let enabledColor: Color = .black
    var handler: (() -> Void) = {}
    
    var body: some View {
        Button {
            handler()
        } label: {
            Text(title)
                .font(.dinBold(size: 20))
                .multilineTextAlignment(.center)
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(disabled ? disabledColor : enabledColor)
                .cornerRadius(24)
        }
        .disabled(disabled)
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BottomButtonView(title: "Regístrate", disabled: .constant(false))
    }
}
