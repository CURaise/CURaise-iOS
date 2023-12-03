//
//  TransactionCardView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct TransactionCardView: View {
    let transaction: Transaction
    
    var body: some View {
        VStack {
            HStack {
                Text(transaction.fundraiser.title)
                    .font(.headline)
                
                Spacer()
                
                Text("$\(transaction.items.map { $0.price }.reduce(0, +), specifier: "%.2f")")
                    .font(.headline)
            }
            
            HStack {
                Text("\(transaction.items.count) items")
                
                Spacer()
                
                Text(transaction.transactionComplete ? "Picked up" : "Pending")
                    .foregroundColor(transaction.transactionComplete ? .green : .blue)
            }
            
            HStack {
                Text("Order placed on \(transaction.timestamp.formatted())")
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)
    }
}

#Preview {
    TransactionCardView(transaction: sampleTransaction)
}
