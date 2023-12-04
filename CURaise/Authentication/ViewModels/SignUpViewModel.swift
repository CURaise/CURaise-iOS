//
//  SignUpViewModel.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation

@Observable
class SignUpViewModel {
    var email: String = ""
    var password: String = ""
    
    var user: Student = Student(id: 0, name: "", netid: "", venmoUsername: "", firebaseUid: "", transactions: [])
    
    func signUp() {
        Task {
            let didCreateUser = await APIService.shared.createUser(user: user, email: email, password: password)
            print(didCreateUser.description)
            try await Task.sleep(nanoseconds: 2_000_000_000)
            await AuthenticationManager.shared.signIn(email: email, password: password)
        }
    }
}
