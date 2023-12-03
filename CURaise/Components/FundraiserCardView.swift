//
//  FundraiserCardView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

struct FundraiserCardView: View {
    var fundraiser: Fundraiser
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle() // replace with image later
                    .fill(Color(red: .random(in: 0...1),
                                green: .random(in: 0...1),
                                blue: .random(in: 0...1)))
                    .frame(height: 125)
            
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(fundraiser.title)
                        .font(.title2)
                    
                    Spacer()
                    
                    Label(fundraiser.endTime.formatted(), systemImage: "clock")
                }
                
                Text(fundraiser.club.name)
                    .font(.headline)
                
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.tertiarySystemFill))
        }
        .cornerRadius(25)
    }
}

#Preview {
    FundraiserCardView(fundraiser: sampleFundraiser)
}
