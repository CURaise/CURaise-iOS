//
//  SelectItemCardView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct SelectItemCardView: View {
    let item: FundraiserItem
    var selected: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                
                HStack {
                    Text(item.name)
                        .font(.headline)
                    
                    Text("-")
                    
                    Text("$\(item.price, specifier: "%.2f")")
                        .font(.headline)
                    
                    Spacer()
                }
                
                Text(item.description)
                
            }
            
            Spacer()
            
            Image(systemName: selected ? "checkmark.circle.fill": "circle")
                .font(.title)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)
    }
}

#Preview {
    SelectItemCardView(item: sampleFundraiserItem, selected: true)
}
