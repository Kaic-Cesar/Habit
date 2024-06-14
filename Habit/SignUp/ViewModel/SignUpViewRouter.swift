//
//  SignUpViewRouter.swift
//  Habit
//
//  Created by Kaic Cesar on 14/06/24.
//

import SwiftUI

enum SignUpViewRouter {
    static func makeHomeView() -> some View {
        return HomeView(viewModel: HomeViewModel())
    }
}
