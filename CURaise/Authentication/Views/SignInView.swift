//
//  SignInView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct SignInView: View {
    @Bindable var vm = SignInViewModel()
    
    var body: some View {
        VStack {
            VStack {
                
                HStack {
                    Text("Sign In")
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding(.vertical, 50)
                
                VStack {
                    HStack {
                        Text("Email")
                            .font(.headline)
                        Spacer()
                    }
                    TextField("Email", text: $vm.email)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                
                
                VStack {
                    HStack {
                        Text("Password")
                            .font(.headline)
                        Spacer()
                    }
                    SecureField("Password", text: $vm.password)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                
                Button {
                    vm.signIn()
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(12)
                }
                .padding(.vertical)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .background(Color(.tertiarySystemFill))
    }
}

#Preview {
    SignInView()
}
