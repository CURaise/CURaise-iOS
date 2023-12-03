//
//  Fundraiser.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import Foundation

struct Fundraiser: Codable, Identifiable {
    let id: Int
    let club: Club
    let title: String
    let description: String
    let activeStatus: Bool
    
    let createdTime: Date
    let lastModifiedTime: Date
    let startTime: Date
    let endTime: Date
    
    let items: [FundraiserItem]
    let transactions: [Transaction]
    
    enum CodingKeys: String, CodingKey {
        case id
        case club
        case title
        case description
        case activeStatus = "active_status"
        case createdTime = "created_datetime"
        case lastModifiedTime = "last_modified_datetime"
        case startTime = "start_datetime"
        case endTime = "end_datetime"
        case items
        case transactions
    }
}

struct FundraiserItem: Codable, Identifiable {
    let id: Int
    let name: String
    let price: Double
    let description: String
}
