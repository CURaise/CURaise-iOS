//
//  RouterView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

struct RouterView: View {
    @State private var tabSelection: TabBarItem = .home
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            StudentHomeView()
                .tabBarItem(tab: .home, selection: $tabSelection)
            
            NavigationStack {
                Text("")
            }
            .tabBarItem(tab: .profile, selection: $tabSelection)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

#Preview {
    RouterView()
}
