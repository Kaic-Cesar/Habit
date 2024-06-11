//
//  HabitApp.swift
//  Habit
//
//  Created by Kaic Cesar on 11/06/24.
//

import SwiftUI

@main
struct HabitApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
