//
//  Club.swift
//  CURaise
//
//  Created by Steven Yu on 12/2/23.
//

import Foundation

struct Club: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let venmoUsername: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case venmoUsername = "venmo_username"
    }
}
