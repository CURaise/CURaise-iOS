//
//  ProfileView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct ProfileView: View {
    @Bindable private var vm: ProfileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                ScrollView {
                    
                    VStack {
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
                                Text("Name: \(vm.user.name)")
                                Spacer()
                            }
                            
                            HStack {
                                Text("NetID: \(vm.user.netid)")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Venmo username: @\(vm.user.venmoUsername)")
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
                        
                        ForEach(vm.user.transactions) { transaction in
                            TransactionCardView(transaction: transaction)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    // for custom navbar
                    Spacer()
                        .frame(height: 80)
                }
                
            }
            .navigationTitle("Profile")
        }
        
    }
}

#Preview {
    ProfileView()
}
