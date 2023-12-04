//
//  AuthenticationManager.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation
import Firebase
import FirebaseAuth

// uses firebase auth to manage authentication
// source: https://firebase.google.com/docs/auth/admin/verify-id-tokens
@Observable
class AuthenticationManager {
    
    var isAuthenticated: Bool = false
    var authToken: String? = nil
    
    private var user: User? = nil
    private var handle: AuthStateDidChangeListenerHandle?
    
    static let shared = AuthenticationManager()
    private init() {
        registerStateListener()
    }
    deinit {
        removeStateListener()
    }
    
    // source: https://peterfriese.dev/posts/replicating-reminder-swiftui-firebase-part2/
    // listens for user session (checks if user is signed in, signed out, user account is available, etc.)
    // handles all the session activities automatically, other functions should not handle isAuthenticated and user
    // source: https://firebase.google.com/docs/auth/ios/start
    private func registerStateListener() {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                print("Signed in")
                self.user = user;
                
                // source: https://firebase.google.com/docs/auth/admin/verify-id-tokens
                user.getIDTokenForcingRefresh(true) { idToken, error in
                    if let error = error {
                        print("Couldn't get auth token")
                        self.isAuthenticated = false;
                        self.user = nil;
                        self.authToken = nil;
                    }
                    print("auth token = \(idToken ?? "NOT FOUND")")
                    self.authToken = idToken
                }
                self.isAuthenticated = true;
            } else {
                self.isAuthenticated = false;
                self.user = nil;
                self.authToken = nil;
            }
        }
        
    }
    
    private func removeStateListener() {
        guard let handle = handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    @MainActor
    func signIn(email: String, password: String) async {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch {
            print("Error when signing in: \(error)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error when signing out: \(error)")
        }
    }
    
}
