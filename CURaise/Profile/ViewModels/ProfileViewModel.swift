//
//  ProfileViewModel.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation

@Observable
class ProfileViewModel {
    var user: Student?
    
    init() {
        user = nil
        getUser()
    }
    
    func getUser() {
        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            user = await APIService.shared.getProfile()
        }
    }
    
    func dummyGetUser() {
        user = Student(id: 0, name: "First Last", netid: "fl123", venmoUsername: "username", firebaseUid: "", transactions: sampleTransactions)
    }
    
    func signOut() {
        AuthenticationManager.shared.signOut()
    }
}
