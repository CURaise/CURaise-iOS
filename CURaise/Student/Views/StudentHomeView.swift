//
//  StudentHomeView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

// the student home view consists
struct StudentHomeView: View {
    @Bindable private var vm = StudentHomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ScrollView {
                    VStack {
                        ForEach(vm.fundraisers) { fundraiser in
                            NavigationLink {
                                FundraiserView(fundraiser: fundraiser)
                            } label: {
                                FundraiserCardView(fundraiser: fundraiser)
                                    .foregroundColor(.primary)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Upcoming Fundraisers")
        }
    }
}

#Preview {
    StudentHomeView()
}
