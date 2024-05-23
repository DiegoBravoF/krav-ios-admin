//
//  Title.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 2/10/23.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.primetime(size: 24))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .lineSpacing(6)
    }
}

struct Headline: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.primetime(size: 18))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .lineSpacing(6)
    }
}

struct Headline1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinBold(size: 18))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .lineSpacing(6)
    }
}

struct Headline2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinBold(size: 16))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .lineSpacing(6)
    }
}

struct PlainText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinRegular(size: 18))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .lineSpacing(6)
    }
}

struct BigNumber: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinRegular(size: 32))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
        
    }
}

struct SmallBold: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinBold(size: 14))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
        
    }
}

struct SmallRegular: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinRegular(size: 14))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
        
    }
}

struct RegularUnderlined: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinRegular(size: 16))
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .underline()
    }
}

struct RegularListItem: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.dinRegular(size: 14))
            .multilineTextAlignment(.leading)

    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Text("REGÍSTRATE")
            .modifier(Title())
    }
}
