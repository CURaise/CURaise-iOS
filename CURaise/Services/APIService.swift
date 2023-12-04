//
//  APIService.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation
import Alamofire

class APIService {
    
    let baseURL: String = "http://34.28.37.199/api"
    
    // decoder
    private let decoder: JSONDecoder
    // source: https://stackoverflow.com/questions/28748162/how-do-i-format-json-date-string-with-swift
    private let dateFormatter: DateFormatter
    
    // singleton
    static let shared = APIService()
    private init() {
        decoder = JSONDecoder()
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
    }
    
    func getFundraisers() async -> [Fundraiser] {
        do {
            let response: GetFundraisersResponse = try await AF.request(baseURL + "/fundraisers")
                .cURLDescription { description in
                    print(description)
                }
                .response(completionHandler: { data in
                    debugPrint(data)
                })
                .validate()
                .serializingDecodable(GetFundraisersResponse.self, decoder: decoder).value
            
            if response.message == .success {
                print("Response was success")
                print(response.data?.debugDescription ?? [])
                return response.data ?? []
            } else {
                print("Response has exception: \(response.exception ?? "")")
                return []
            }
        } catch {
            print("Error occured: \(error)")
            return []
        }
    }
    
    func getProfile() async -> Student? {
        guard let authToken = AuthenticationManager.shared.authToken else {
            print("No auth token available")
            return nil
        }
        
        let parameters = [
            "Authorization": authToken
        ]
        
        do {
            let response: GetProfileResponse = try await AF.request(baseURL + "/students/my", parameters: parameters)
                .cURLDescription { description in
                    print(description)
                }
                .response(completionHandler: { data in
                    debugPrint(data)
                })
                .validate()
                .serializingDecodable(GetProfileResponse.self, decoder: decoder).value
            
            if response.message == .success {
                print("Response was success")
                print(response.data.debugDescription)
                return response.data
            } else {
                print("Response has exception: \(response.exception ?? "")")
                return nil
            }
            
        } catch {
            print("Error occured: \(error)")
            return nil
        }
    }
    
    func verifyPayment(transaction: Transaction) async -> Bool {
        guard let authToken = AuthenticationManager.shared.authToken else {
            print("No auth token available")
            return false
        }
        
        let parameters = [
            "Authorization": authToken,
            "club_venmo_username": transaction.fundraiser.club.venmoUsername
        ]
        
        do {
            let response: VerifyPaymentResponse = try await AF.request(baseURL + "/transactions/verify", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .cURLDescription { description in
                    print(description)
                }
                .response(completionHandler: { data in
                    debugPrint(data)
                })
                .validate()
                .serializingDecodable(VerifyPaymentResponse.self).value
            
            if response.message == .success {
                print("Response was success")
                return true
            } else {
                print("Response has exception: \(response.exception ?? "")")
                return false
            }
            
        } catch {
            print("Error occured: \(error)")
            return false
        }
    }
    
    func createTransaction(transaction: Transaction) async -> Bool {
        guard let authToken = AuthenticationManager.shared.authToken else {
            print("No auth token available")
            return false
        }
                
        let parameters: Parameters = [
            "Authorization": authToken,
            "fundraiser_id": transaction.fundraiser.id,
            "club_id": transaction.fundraiser.club.id,
            "fundraiser_item_id": transaction.items.map{ $0.id } // list of fundraiser item ids in transactions
        ]
        
        do {
            let response: CreateTransactionResponse = try await AF.request(baseURL + "/transactions/create", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .cURLDescription { description in
                    print(description)
                }
                .response(completionHandler: { data in
                    debugPrint(data)
                })
                .validate()
                .serializingDecodable(CreateTransactionResponse.self).value
            
            if response.message == .success {
                print("Response was success")
                return true
            } else {
                print("Response has exception: \(response.exception ?? "")")
                return false
            }
            
        } catch {
            print("Error occured: \(error)")
            return false
        }
    }
    
    // creates a user through the api and then returns if creation was successful
    func createUser(user: Student, email: String, password: String) async -> Bool {
        do {
            let parameters = [
                "name": user.name,
                "netid": user.netid,
                "venmo_username": user.venmoUsername,
                "email": email,
                "password": password
            ]
            
            let response: CreateUserResponse = try await AF.request(baseURL + "/students/signup", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .cURLDescription { description in
                    print(description)
                }
                .response(completionHandler: { data in
                    debugPrint(data)
                })
                .validate()
                .serializingDecodable(CreateUserResponse.self, decoder: decoder).value
            
            if response.message == .success {
                print("Response was success")
                return true
            } else {
                print("Response has exception: \(response.exception ?? "")")
                return false
            }
            
        } catch {
            print("Error occured: \(error)")
            return false
        }
    }
    
}
