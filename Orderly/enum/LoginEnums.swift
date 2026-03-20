//
//  LoginEnums.swift
//  MVVM_V1
//
//  Created by Seng Phrakonkham on 2026. 01. 26..
//

import Foundation

enum LoginResult {
    case success
    case failed(errorMessage: String)
}

enum LoginError: Error, LocalizedError {
    case noError
    case invalidPassword
    case invalidUserName
    case invalidName
    case invalidEmail
    
    var errorDescription: String? {
        switch self {
        case .noError:
            return nil
        case .invalidPassword:
            return "Password must be at least 6 characters long and contain both letters and numbers"
        case .invalidUserName:
            return "Username must be at least 4 characters long"
        case .invalidName:
            return "Name must be at least 3 characters long"
        case .invalidEmail:
            return "Email is not valid"
        }
    }
}
