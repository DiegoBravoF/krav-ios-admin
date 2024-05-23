//
//  Link.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 2/11/23.
//

import SwiftUI

struct Link: ViewModifier {
    var color: Color = .blue
    func body(content: Content) -> some View {
        content
            .font(.dinRegular(size: 22))
            .foregroundColor(.black)
            .frame(width: 280, height: 42)
            .background(color)
            .cornerRadius(24)
    }
}

struct Link_Previews: PreviewProvider {
    static var previews: some View {
        Text("Prueba")
            .modifier(Link())
    }
}
