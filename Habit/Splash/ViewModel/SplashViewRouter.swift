//
//  SplashViewRouter.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        return SignInView(viewModel: SignInViewModel())
    }
}
