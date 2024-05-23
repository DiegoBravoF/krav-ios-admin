//
//  TabbarView.swift
//  KairosKM
//
//  Created by Veronica Cordobés on 18/10/23.
//

import SwiftUI

enum Tabs {
    case home
    case students
    case classes
    case payments
    case issues
    case injuries
}

struct TabbarView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor(Color.gray.opacity(0.1))

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    @State private var selectedTab: Tabs = .home

    var body: some View {
        ZStack {
                NavigationStack {
                    VStack {
                        TabView(selection: $selectedTab) {
                            HomeView()
                                .tabItem {
                                    Label("", systemImage: "dumbbell.fill")
                                }
                                .tag(Tabs.home)
                            AssistanceView()
                                .tabItem {
                                    Label("", systemImage: "person.3.fill")
                                }
                                .tag(Tabs.students)
                            HomeView()
                                .tabItem {
                                    Label("", systemImage: "person.2.crop.square.stack")
                                }
                                .tag(Tabs.classes)
                            PaymentView()
                                .tabItem {
                                    Label("", systemImage: "creditcard.and.123")
                                }
                                .tag(Tabs.payments)
                            PaymentView()
                                .tabItem {
                                    Label("", systemImage: "light.beacon.min.fill")
                                }
                                .tag(Tabs.issues)
                            PaymentView()
                                .tabItem {
                                    Label("", systemImage: "cross.case")
                                }
                                .tag(Tabs.injuries)
                        }
                        .accentColor(Color.black)
                    }
                }
                .padding(.top, 10)
            }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
