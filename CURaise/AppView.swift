//
//  AppView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct AppView: View {
    @State private var tabSelection: TabBarItem = .explore

    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            ExploreFundraisersView()
                .tabBarItem(tab: .explore, selection: $tabSelection)
            
            ProfileView()
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    AppView()
}
