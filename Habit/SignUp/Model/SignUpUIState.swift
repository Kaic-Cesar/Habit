//
//  SignUpUIState.swift
//  Habit
//
//  Created by Kaic Cesar on 14/06/24.
//

import Foundation

enum SignUpUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
