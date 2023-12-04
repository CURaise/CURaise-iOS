//
//  Student.swift
//  CURaise
//
//  Created by Steven Yu on 12/2/23.
//

import Foundation

struct Student: Codable, Identifiable {
    let id: Int
    var name: String
    var netid: String
    var venmoUsername: String
    let firebaseUid: String
    let transactions: [Transaction]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case netid
        case venmoUsername
        case firebaseUid
        case transactions
    }
}
