//
//  CreateTransactionView.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import SwiftUI

struct CreateTransactionView: View {
    @Bindable var vm: CreateTransactionViewModel
        
    @Environment(\.dismiss) private var dismiss

    init(fundraiser: Fundraiser) {
        vm = CreateTransactionViewModel(fundraiser: fundraiser)
    }
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView {
                    VStack {
                        VStack {
                            HStack {
                                Text("Fundraiser Details")
                                    .font(.headline)
                                Spacer()
                            }
                            Divider()
                        }
                        .padding(.top)
                        
                        VStack {
                            HStack {
                                Text("Title: \(vm.fundraiser.title)")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Description: \(vm.fundraiser.description)")
                                Spacer()
                            }
                            
                            HStack {
                                Text("Club: \(vm.fundraiser.club.name)")
                                Spacer()
                            }
                        }
                        
                        VStack {
                            HStack {
                                Text("Order Items")
                                    .font(.headline)
                                Spacer()
                            }
                            Divider()
                        }
                        .padding(.top)
                        
                        
                        VStack {
                            ForEach(vm.fundraiser.items) { item in
                                SelectItemCardView(item: item, selected: vm.transaction.items.contains(item))
                                    .onTapGesture {
                                        if let index = vm.transaction.items.firstIndex(of: item) {
                                            vm.transaction.items.remove(at: index)
                                        } else {
                                            vm.transaction.items.append(item)
                                        }
                                    }
                            }
                            
                            Spacer()
                                .frame(height: 20)
                            
                            Text("Total: $\(vm.transaction.items.map { $0.price }.reduce(0, +), specifier: "%.2f")")
                                .font(.headline)
                        }
                        
                        VStack {
                            HStack {
                                Text("Payment")
                                    .font(.headline)
                                Spacer()
                            }
                            Divider()
                        }
                        .padding(.top)
                        
                        VStack {
                            HStack {
                                Text("Make a payment of $\(vm.transaction.items.map { $0.price }.reduce(0, +), specifier: "%.2f") to @\(vm.fundraiser.club.venmoUsername) on Venmo and tap the button below afterwards to verify your payment.")
                                
                                Spacer()
                            }
                            
                            Button {
                                vm.verifyPayment()
                            } label: {
                                Text("Verify Venmo Payment")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor)
                                    .cornerRadius(12)
                            }
                            
                            Text("Payment status: \(vm.paymentStatus ? "valid" : "invalid")")
                                .font(.headline)
                        }
                        
                        
                        VStack {
                            HStack {
                                Text("Confirm Order")
                                    .font(.headline)
                                Spacer()
                            }
                            Divider()
                        }
                        .padding(.top)
                        
                        VStack {
                            
                            Button {
                                Task {
                                    await vm.submitTransaction()
                                    try await Task.sleep(nanoseconds: 1_000_000_000)
                                    dismiss()
                                }
                            } label: {
                                Text("Place Order")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.accentColor)
                                    .cornerRadius(12)
                            }
                            .disabled(!vm.paymentStatus)
                            
                        }
                        
                        // for custom navbar
                        Spacer()
                            .frame(height: 80)
                    }
                    .padding(.horizontal)

                }
                
                if let orderSuccessful = vm.orderSuccessful {
                    VStack {
                        Text(orderSuccessful ? "Successfully placed order": "Order couldn't be placed")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(orderSuccessful ? Color.green : Color.red)
                            .cornerRadius(12)
                            .shadow(radius: 5)
                            .frame(height: 30)
                            .padding(.top, 25)
                        
                        Spacer()
                    }
                    .padding(.horizontal)

                }
                
            }
        }
        .navigationTitle("Your order")
    }
}

#Preview {
    NavigationStack {
        CreateTransactionView(fundraiser: sampleFundraiser)
    }
}
