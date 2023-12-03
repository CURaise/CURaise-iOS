//
//  ProfileViewModel.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation

@Observable
class ProfileViewModel {
    let user: Student = Student(id: 1, name: "First Last", netid: "fl123", venmoUsername: "username", firebaseUid: "", transactions: sampleTransactions)
    
    
}
