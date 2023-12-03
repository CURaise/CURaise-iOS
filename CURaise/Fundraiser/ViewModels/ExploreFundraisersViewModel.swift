//
//  ExploreFundraisersViewModel.swift
//  CURaise
//
//  Created by Steven Yu on 11/19/23.
//

import Foundation

@Observable
class ExploreFundraisersViewModel {
    var fundraisers: [Fundraiser]
    
    init() {
        fundraisers = []
        dummyGetActiveFundraisers()
    }
    
    func dummyGetActiveFundraisers() {
        for num in 0..<10 {
            fundraisers.append(Fundraiser(id: num, club: sampleClub, title: "Fundraiser \(num)", description: "Fundraiser description", activeStatus: true, createdTime: Date.now, lastModifiedTime: Date.now, startTime: Date.now, endTime: Date.now, items: sampleFundraiserItems))
        }
    }
}
