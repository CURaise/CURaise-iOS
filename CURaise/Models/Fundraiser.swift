//
//  Fundraiser.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import Foundation

struct Fundraiser: Codable, Identifiable {
    let id: Int
    let club: String // tentative
    let title: String
    let description: String
    let startTime: Date
    let endTime: Date
    let items: [String] // tentative
    let transactions: [String] // tentative
}
