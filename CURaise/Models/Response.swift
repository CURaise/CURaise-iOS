//
//  Response.swift
//  CURaise
//
//  Created by Steven Yu on 12/3/23.
//

import Foundation

enum ResponseType: String, Codable {
    case success
    case error
}

struct GetFundraisersResponse: Codable {
    let message: ResponseType
    let data: [Fundraiser]? // only happens when .success
    let exception: String? // only happens when .error
}
