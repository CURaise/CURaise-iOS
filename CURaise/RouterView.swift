//
//  RouterView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

struct RouterView: View {
    var body: some View {
        if AuthenticationManager.shared.isAuthenticated {
            AppView()
        } else {
            AuthenticationView()
        }
    }
}

#Preview {
    RouterView()
}
