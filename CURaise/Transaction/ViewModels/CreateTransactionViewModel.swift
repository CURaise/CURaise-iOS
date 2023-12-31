//
//  CreateTransactionViewModel.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation

@Observable
class CreateTransactionViewModel {
    let fundraiser: Fundraiser
    var transaction: Transaction
    
    var paymentStatus: Bool
    
    var orderSuccessful: Bool?
    
    init(fundraiser: Fundraiser) {
        self.fundraiser = fundraiser
        // just put id as 0 for now
        // TODO: ADD USER LOGIC
        self.transaction = Transaction(id: 0, referenceString: "", fundraiser: fundraiser, timestamp: Date.now, items: [], buyerId: -1, transactionComplete: false)
        self.paymentStatus = false
        self.orderSuccessful = nil
    }
    
    func verifyPayment() {
        Task {
            paymentStatus = await APIService.shared.verifyPayment(transaction: transaction)
        }
    }
    
    func submitTransaction() async {
        if paymentStatus {
            orderSuccessful = await APIService.shared.createTransaction(transaction: transaction)
        } else {
            print("Payment not verified!")
        }
    }
}
