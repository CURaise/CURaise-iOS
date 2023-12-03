//
//  RouterView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

struct RouterView: View {
    @State private var tabSelection: TabBarItem = .explore
    
    var body: some View {
        CustomTabBarContainerView(selection: $tabSelection) {
            ExploreFundraisersView()
                .tabBarItem(tab: .explore, selection: $tabSelection)
            
            ProfileView()
                .tabBarItem(tab: .profile, selection: $tabSelection)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .onAppear {
            Task {
                await APIService.shared.getFundraisers()
            }
        }
    }
}

#Preview {
    RouterView()
}
