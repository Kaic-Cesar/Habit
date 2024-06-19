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
    
    var index: Self.AllCases.Index {
        return Self.allCases.firstIndex{self == $0} ?? 0
    }
}
