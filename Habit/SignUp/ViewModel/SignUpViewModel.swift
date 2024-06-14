//
//  SignUpViewModel.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    @Published var uiState: SignUpUIState = .none
    
    var publisher: PassthroughSubject<Bool, Never>!

    
    func signUp() {
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .success
            self.publisher.send(true)
        }
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
