//
//  ErrorTypes.swift
//  Sneakerverse
//
//  Created by Dung  on 22.12.20.
//

import Foundation

enum LoginError: Error {
    case decodingError
    case loginError
    case userNotFound
}

enum SignUpError: Error{
    case emailAlreadyUsed
    case signUpError
}

enum SneakerServiceError: Error{
    case sendingOfferError
    case sneakerServiceError
}

enum ChatServiceError: Error{
    case chatServiceError
    case chatNotFound
}

enum ProfileError: Error{
    case profileError
    case userNotFound
}
