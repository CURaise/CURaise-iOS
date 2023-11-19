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
                    .fill(Color.gray)
                    .frame(height: 125)
            
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text(fundraiser.title)
                        .font(.title2)
                    
                    Spacer()
                    Image(systemName: "clock")
                    Text(fundraiser.endTime.formatted())
                }
                
                Text(fundraiser.club)
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
    FundraiserCardView(fundraiser: Fundraiser(id: 1, club: "Club One", title: "Fundraiser", description: "Cool Club", startTime: Date.now, endTime: Date.now, items: [], transactions: []))
}
