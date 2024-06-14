//
//  Gender.swift
//  Habit
//
//  Created by Kaic Cesar on 14/06/24.
//

import SwiftUI

enum Gender: String, CaseIterable, Identifiable {
    case male = "Masculino"
    case female = "Feminino"
    
    var id: String {
        self.rawValue
    }
}
