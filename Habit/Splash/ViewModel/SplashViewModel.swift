//
//  SplashViewModel.swift
//  Habit
//
//  Created by Kaic Cesar on 11/06/24.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.uiState = .goToSignScreen
        }
    }
    

}

extension SplashViewModel {
    func singInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
