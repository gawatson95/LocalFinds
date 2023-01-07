//
//  LFError.swift
//  LocalFinds
//
//  Created by Grant Watson on 1/2/23.
//

import Foundation

enum LFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case unableToFavorite = "Unable to add this user to your favorites. Please try again."
    case alreadyInFavorites = "This user is already in your favorites."
}
