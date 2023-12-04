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

struct GetProfileResponse: Codable {
    let message: ResponseType
    let data: Student? // only happens when .success
    let exception: String? // only happens when .error
}

struct CreateUserResponse: Codable {
    let message: ResponseType
    let exception: String? // only happens when .error
}

struct VerifyPaymentResponse: Codable {
    let message: ResponseType
    let exception: String? // only happens when .error
}

struct CreateTransactionResponse: Codable {
    let message: ResponseType
    let exception: String?
}
