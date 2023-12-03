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
    
    enum CodingKeys: String, CodingKey {
        case id
        case club
        case title
        case description
        case activeStatus
        case createdTime
        case lastModifiedTime
        case startTime
        case endTime
        case items
    }
}

struct FundraiserItem: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let price: Double
    let description: String
}
