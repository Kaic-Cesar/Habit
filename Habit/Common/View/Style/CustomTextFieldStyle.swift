//
//  CustomTextFieldStyle.swift
//  Habit
//
//  Created by Kaic Cesar on 17/06/24.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    
    @FocusState public var isFocus
    
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(isFocus ? .orange : .gray, lineWidth: 1.2)
            )
            .focused($isFocus)
    }
}
