//
//  Subtitle.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 2/10/23.
//

import SwiftUI

struct Subtitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinRegular(size: 16))
            .lineSpacing(6)
    }
}

struct Subtitle_Previews: PreviewProvider {
    static var previews: some View {
        Text("Es necesario que te registres antes de acceder a tu clase. Para ello, pulsa el botón registrar y acerca tu dispositivo a uno de los puntos NFC que encontrarás en recepción.")
            .modifier(Subtitle())
    }
}
