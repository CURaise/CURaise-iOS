//
//  FundraiserView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

struct FundraiserView: View {
    let vm: FundraiserViewModel
    
    init(fundraiser: Fundraiser) {
        self.vm = FundraiserViewModel(fundraiser: fundraiser)
    }
    
    var body: some View {
        VStack {
            
            ScrollView {
                NavigationLink {
                    Text("Order Page")
                } label: {
                    Text("Order Now!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                }

                
                Rectangle() // replace with image later
                    .fill(Color.gray)
                    .frame(height: 250)
                    .cornerRadius(15)
                
                Divider()
                
                Text(vm.fundraiser.club)
                    .font(.title2)
                    .bold()
                
                VStack(spacing: 20) {
                    Text("\(vm.fundraiser.startTime.formatted()) - \(vm.fundraiser.endTime.formatted())")
                        .font(.headline)
                    
                    VStack {
                        HStack {
                            Text("Description: ")
                                .font(.headline)
                            Spacer()
                        }
                        
                        HStack {
                            Text(vm.fundraiser.description)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                    }
                    
                    VStack {
                        HStack {
                            Text("Items: ")
                                .font(.headline)
                            Spacer()
                        }
                        
                        ForEach(vm.fundraiser.items, id:\.self) { item in
                            ItemCardView(item: item)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(vm.fundraiser.title)
    }
}

#Preview {
    NavigationStack {
        FundraiserView(fundraiser: Fundraiser(id: 1, club: "Club One", title: "Fundraiser", description: "Cool Club's fundraiser", startTime: Date.now, endTime: Date.now, items: ["one", "two", "three", "four", "five", "six"], transactions: []))
    }
}
