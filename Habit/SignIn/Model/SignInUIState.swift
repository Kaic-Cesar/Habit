//
//  SignInUIState.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
