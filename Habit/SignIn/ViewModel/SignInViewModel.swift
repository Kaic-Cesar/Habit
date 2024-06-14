//
//  SignInViewModel.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    @Published var uiState: SignInUIState = .none
    
    private var cancellable: AnyCancellable?
    private let publisher = PassthroughSubject<Bool, Never>()
        
    init() {
        cancellable = publisher.sink { value in
            print("Usuário criado! goToHome \(value)")
        
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func login(email: String, password: String) {
        
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .goToHomeScreen
        }
    }
}

extension SignInViewModel {
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView()
    }
    
    func singUpView() -> some View {
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}
