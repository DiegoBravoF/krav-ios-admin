//
//  ClassSelectionView.swift
//  kairosKMAdmin
//
//  Created by Veronica Cordobés on 26/12/23.
//

import SwiftUI

struct ClassSelectionView: View {
    @Binding var classes: [Class]
    @State var selectedClass: Class?

    var body: some View {
        HStack(spacing: 20) {
            ForEach(classes, id: \.self)  { item in
            }
//            RadioButton(tag: item, selection: $selectedClass, label: item.title)
        }
    }
}

struct ClassSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ClassSelectionView(classes: .constant([Class(id: "1"), Class(id: "2"), Class(id: "3")]))
    }
}
