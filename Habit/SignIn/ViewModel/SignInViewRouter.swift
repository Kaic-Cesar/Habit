//
//  SignInViewRouter.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//


import SwiftUI

enum SignInViewRouter {
    static func makeHomeView() -> some View {
        return HomeView(viewModel: HomeViewModel())
    }
    
    static func makeSignUpView() -> some View {
        return SignUpView(viewModel: SignUpViewModel())
    }
}
