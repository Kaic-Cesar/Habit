//
//  SignInView.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View {
        Text("Ola signIn")
            .background(.blue)
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
}
