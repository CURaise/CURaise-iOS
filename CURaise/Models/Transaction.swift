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
    let items: [FundraiserItem]
    
    let buyer: Student
    
    let status: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case referenceString
        case fundraiser
        case timestamp
        case items
        case buyer
        case status
    }
}
