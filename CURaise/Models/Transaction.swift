//
//  Transaction.swift
//  CURaise
//
//  Created by Steven Yu on 12/2/23.
//

import Foundation

struct Transaction: Codable, Identifiable {
    let id: Int
    let referenceString: String // referral text
    let fundraiserId: Int
    let timestamp: Date // when the transaction was made
    let items: [FundraiserItem]
    
    let buyerId: Int // id of the student who made the transaction
    
    let transactionComplete: Bool // if transaction was complete (user picked up their purchase)
    
    enum CodingKeys: String, CodingKey {
        case id
        case referenceString
        case fundraiserId = "fundraiser_id"
        case timestamp
        case items
        case buyerId = "buyer_id"
        case transactionComplete = "transaction_complete"
    }
}
