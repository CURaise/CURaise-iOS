//
//  APIService.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation
import Alamofire

class APIService {
        
    
    let baseURL: String = "http://10.48.3.248:8888/api"
    
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
}
