//
//  SignUpView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct SignUpView: View {
    @Bindable var vm = SignUpViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                
                HStack {
                    Text("Sign Up")
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
                        .keyboardType(.emailAddress)
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
                
                VStack {
                    HStack {
                        Text("Name")
                            .font(.headline)
                        Spacer()
                    }
                    TextField("Name", text: $vm.user.name)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                
                VStack {
                    HStack {
                        Text("NetID")
                            .font(.headline)
                        Spacer()
                    }
                    TextField("NetID", text: $vm.user.netid)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                
                VStack {
                    HStack {
                        Text("Venmo Username")
                            .font(.headline)
                        Spacer()
                    }
                    TextField("Venmo Username", text: $vm.user.venmoUsername)
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                
                Button {
                    vm.signUp()
                } label: {
                    Text("Sign Up")
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
    SignUpView()
}
