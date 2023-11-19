//
//  StudentHomeViewModel.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import Foundation

@Observable
class StudentHomeViewModel {
    var fundraisers: [Fundraiser]
    
    init() {
        fundraisers = []
        dummyGetActiveFundraisers()
    }
    
    func dummyGetActiveFundraisers() {
        let randomItems = ["item 1", "item 2", "item 3", "item 4", "item 5", "item 6", "item 7"]
        for num in 0..<10 {
            fundraisers.append(Fundraiser(id: num, club: "Club \(num)", title: "Fundraiser \(num)", description: "sample", startTime: Date.now, endTime: Date.now, items: randomItems, transactions: []))
        }
    }
}
