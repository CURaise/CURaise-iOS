//
//  ProfileView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct ProfileView: View {
    @Bindable private var vm: ProfileViewModel = ProfileViewModel()
    
    @State var showDeleteAccount: Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                ScrollView {
                    
                    if let user = vm.user {
                        
                        VStack {
                            
                            VStack {
                                HStack {
                                    Text("Actions")
                                        .font(.headline)
                                    Spacer()
                                }
                                Divider()
                            }
                            .padding(.top)
                            
                            VStack {
                                HStack {
                                    Button {
                                        vm.signOut()
                                    } label: {
                                        Text("Sign Out")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.accentColor)
                                            .cornerRadius(12)
                                    }
                                    
                                    Button {
                                        showDeleteAccount.toggle()
                                    } label: {
                                        Text("Delete Account")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .padding()
                                            .frame(maxWidth: .infinity)
                                            .background(Color.red)
                                            .cornerRadius(12)
                                    }
                                }
                            }
                            
                            VStack {
                                HStack {
                                    Text("Your info")
                                        .font(.headline)
                                    Spacer()
                                }
                                Divider()
                            }
                            .padding(.top)
                            
                            VStack {
                                HStack {
                                    Text("Name: \(user.name)")
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("NetID: \(user.netid)")
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Venmo username: @\(user.venmoUsername)")
                                    Spacer()
                                }
                            }
                            
                            VStack {
                                HStack {
                                    Text("Your transactions")
                                        .font(.headline)
                                    Spacer()
                                }
                                Divider()
                            }
                            .padding(.top)
                            
                            if user.transactions.isEmpty {
                                Text("No transactions yet.")
                            } else {
                                ForEach(user.transactions) { transaction in
                                    TransactionCardView(transaction: transaction)
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                    } else {
                        Text("Couldn't retrieve profile.")
                    }
                    
                    
                    // for custom navbar
                    Spacer()
                        .frame(height: 80)
                }
                .refreshable {
                    print("Refreshed profile")
                    vm.getUser()
                }
                
            }
            .navigationTitle("Profile")
            .alert(
                "Are you sure you want to delete your account?",
                isPresented: $showDeleteAccount
            ) {
                Button("Delete", role: .destructive) {
                    
                }
                
                Button("Cancel", role: .cancel) { }
            }
            
        }
        
    }
}

#Preview {
    ProfileView()
}
