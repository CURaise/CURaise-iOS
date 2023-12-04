//
//  SignInViewModel.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation

@Observable
class SignInViewModel {
    var email: String = ""
    var password: String = ""
    
    func signIn() {
        Task {
            await AuthenticationManager.shared.signIn(email: email, password: password)
        }
    }
}
