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
    let fundraiser: Fundraiser
    let timestamp: Date // when the transaction was made
    var items: [FundraiserItem]
    
    let buyerId: Int // id of the student who made the transaction
    
    let transactionComplete: Bool // if transaction was complete (user picked up their purchase)
    
    enum CodingKeys: String, CodingKey {
        case id
        case referenceString
        case fundraiser
        case timestamp
        case items
        case buyerId
        case transactionComplete
    }
}
