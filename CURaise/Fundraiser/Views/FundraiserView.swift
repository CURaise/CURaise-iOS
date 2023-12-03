//
//  FundraiserView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

// individual fundraiser page
struct FundraiserView: View {
    @Bindable var vm: FundraiserViewModel
    
    init(fundraiser: Fundraiser) {
        self.vm = FundraiserViewModel(fundraiser: fundraiser)
    }
    
    var body: some View {
        VStack {
            
            ZStack {
                ScrollView {
                    Rectangle() // replace with image later
                        .fill(Color.gray)
                        .frame(height: 250)
                        .cornerRadius(15)
                    
                    Divider()
                    
                    Text(vm.fundraiser.club.name)
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
                            
                            ForEach(vm.fundraiser.items) { item in
                                ItemCardView(item: item)
                            }
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    
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
                            .shadow(radius: 2)
                    }
                        .padding()
                }
            }
            
        }
        .padding(.horizontal)
        .navigationTitle(vm.fundraiser.title)
    }
}



let sampleClub: Club = Club(id: 1, name: "First Club", description: "Club description", venmoUsername: "@username")
let sampleFundraiserItem: FundraiserItem = FundraiserItem(id: 1, name: "Food 1", price: 2, description: "Item description")
let sampleFundraiserItems: [FundraiserItem] = [sampleFundraiserItem, FundraiserItem(id: 2, name: "Food 2", price: 3, description: "Item description"), FundraiserItem(id: 3, name: "Food 3", price: 4.5, description: "Item description")]
let sampleTransactions: [Transaction] = [Transaction(id: 1, referenceString: "Referred by: ", fundraiserId: 1, timestamp: Date.now, items: sampleFundraiserItems, buyerId: 1, transactionComplete: false)]

let sampleFundraiser: Fundraiser = Fundraiser(id: 1, club: sampleClub, title: "Fundraiser 1", description: "Fundraiser description", activeStatus: true, createdTime: Date.now, lastModifiedTime: Date.now, startTime: Date.now, endTime: Date.now, items: sampleFundraiserItems, transactions: sampleTransactions)

#Preview {
    NavigationStack {
        FundraiserView(fundraiser: sampleFundraiser)
    }
}
