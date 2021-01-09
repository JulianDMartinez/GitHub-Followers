//
//  GFError.swift
//  GitHub Followers
//
//  Created by Julian Martinez on 1/8/21.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidReponse     = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
}

