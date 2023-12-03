//
//  Student.swift
//  CURaise
//
//  Created by Steven Yu on 12/2/23.
//

import Foundation

struct Student: Codable, Identifiable {
    let id: Int
    let name: String
    let netid: String
    let venmoUsername: String
    let transactions: [Transaction]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case netid
        case venmoUsername = "venmo_username"
        case transactions
    }
}
