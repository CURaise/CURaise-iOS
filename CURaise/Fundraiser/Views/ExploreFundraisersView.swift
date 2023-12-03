//
//  ExploreFundraisersView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

// gets all active fundraisers from the api and shows to user
struct ExploreFundraisersView: View {
    @Bindable private var vm = ExploreFundraisersViewModel()
    
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
                    
                    // for custom navbar
                    Spacer()
                        .frame(height: 80)
                    
                }
            }
            .navigationTitle("Upcoming Fundraisers")
        }
    }
}

#Preview {
    ExploreFundraisersView()
}
