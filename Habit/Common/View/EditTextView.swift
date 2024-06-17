//
//  EditTextView.swift
//  Habit
//
//  Created by Kaic Cesar on 17/06/24.
//

import SwiftUI

struct EditTextView: View {
    
    @Binding var text: String
    
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var isSecure: Bool = false
    var failure: Bool? = nil
    var error: String? = nil
    
    
    var body: some View {
        VStack {
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundStyle(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            } else {
                TextField(placeholder, text: $text)
                    .foregroundStyle(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            
            if let error = error, !text.isEmpty, failure == true {
                Text(error)
                    .foregroundStyle(.red)
            }
            

        }
        .padding(.bottom, 10)
    }
}

#Preview {
    EditTextView(text: .constant(""),
                 placeholder: "E-mail",
                 isSecure: false,
                 failure: "a@a.com".count < 4,
                 error: "Campo inválido")
    .padding()
}
