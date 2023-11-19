//
//  ItemCardView.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import SwiftUI

struct ItemCardView: View {
    let item: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(item)
                    .font(.headline)
                
                Spacer()
            }
            
            Text("item description")
            
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)
    }
}

#Preview {
    ItemCardView(item: "ITEM")
}
