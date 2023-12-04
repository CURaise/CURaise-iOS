//
//  AuthenticationView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct AuthenticationView: View {
    @State var showSignInView: Bool = false
    @State var showSignUpView: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                Spacer()
                
                VStack {
                    Text("Welcome to")
                    Text("CURaise")
                        .font(.largeTitle)
                        .bold()
                }
                
                Spacer()
                
                VStack {
                    Button {
                        showSignUpView.toggle()
                    } label: {
                        Text("Sign Up")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(12)
                    }
                    
                    
                    Button {
                        showSignInView.toggle()
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(12)
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .sheet(isPresented: $showSignUpView) {
                SignUpView()
            }
            .sheet(isPresented: $showSignInView) {
                SignInView()
            }
        }
    }
}

#Preview {
    AuthenticationView()
}
