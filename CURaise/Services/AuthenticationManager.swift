//
//  AuthenticationManager.swift
//  CURaise
//
//  Created by Steven Yu on 10/21/23.
//

import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseAuth
import FirebaseAuthCombineSwift

class FirebaseAuthenticationManager: ObservableObject {
    @Published var isAuthenticated: Bool = UserDefaults.standard.bool(forKey: "authenticated")
    
    @Published var token: String = ""
    
    @Published var errorMessage: String?
    @Published var hasError: Bool = false
    
    private var handle: AuthStateDidChangeListenerHandle?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        print("Authentication Manager initialized")
        print(isAuthenticated)
        addSubscribers()
        registerStateListener()
    }
    
    deinit {
        guard let handle = handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    private func addSubscribers() {
        
        // waits 5 seconds after errorMessage is changed to erase the errorMessage
        $errorMessage
            .debounce(for: .seconds(5), scheduler: RunLoop.main)
            .sink { _ in
                self.errorMessage = nil
                self.hasError = false
            }
            .store(in: &cancellables)
        
    }
    
    // source: https://peterfriese.dev/posts/replicating-reminder-swiftui-firebase-part2/
    // listens for user session (checks if user is signed in, signed out, user account is available, etc.)
    // handles all the session activities automatically, other functions should not handle isAuthenticated and user
    // source: https://firebase.google.com/docs/auth/ios/start
    func registerStateListener() {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                user.getIDTokenForcingRefresh(true) { idToken, error in
                    if let error = error {
                        self.errorMessage = error.localizedDescription
                        self.hasError = true
                        
                        self.isAuthenticated = false
                        UserDefaults.standard.set(false, forKey: "authenticated")
                    }
                    
                    withAnimation(.easeInOut) {
                        self.token = idToken ?? ""
                        self.isAuthenticated = true
                        UserDefaults.standard.set(true, forKey: "authenticated")
                    }
                }
            } else {
                withAnimation(.easeInOut) {
                    self.isAuthenticated = false
                    UserDefaults.standard.set(false, forKey: "authenticated")
                }
                print("User N/A")
            }
        }
    }
    
    func reinstallStateListener() {
        registerStateListener()
    }
    
    func removeStateListener() {
        guard let handle = handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    @MainActor
    func signIn(email: String, password: String) async {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        }
        catch {
            print("There was an issue when trying to sign in: \(error)")
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
    
    @MainActor
    func signOut() async {
        do {
            try Auth.auth().signOut()
            
            // clear user defaults
            UserDefaults.standard.set(false, forKey: "authenticated")
            print("Signed out")
        } catch {
            print("There was an issue when trying to sign out: \(error)")
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
    
    @MainActor
    func signUp(email: String, password: String) async {
        do {
            let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        } catch {
            print("There was an issue when trying to sign up: \(error)")
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
        
    @MainActor
    func sendPasswordReset(email: String? = nil) {
        if let email {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error {
                    self.errorMessage = "Couldn't send password reset: \(error.localizedDescription)"
                    self.hasError = true
                }
            }
        } else if let email = Auth.auth().currentUser?.email {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error {
                    self.errorMessage = "Couldn't send password reset: \(error.localizedDescription)"
                    self.hasError = true
                }
            }
        }
    }
}
