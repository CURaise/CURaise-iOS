//
//  StudentHomeView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

struct StudentHomeView: View {
    @Bindable private var vm = StudentHomeViewModel()
    
    var body: some View {
        VStack {
            
            ScrollView {
                
//                HStack {
//                    Text("Upcoming Fundraisers")
//                        .font(.title)
//                        .bold()
//                    Spacer()
//                }
//                .padding(.horizontal)
                
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

#Preview {
    StudentHomeView()
}
