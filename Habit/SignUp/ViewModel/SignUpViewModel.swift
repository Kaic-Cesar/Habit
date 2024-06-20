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
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var phone = ""
    @Published var document = ""
    @Published var birthday = ""
    @Published var gender = Gender.male
    
    var publisher: PassthroughSubject<Bool, Never>!

    
    func signUp() {
        self.uiState = .loading
        
        // Pega a String -> dd/MM/yyyy -> Date
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX") // padrão
        formatter.dateFormat = "dd/MM/yyyy"
    
        let dateFormatted = formatter.date(from: birthday)
        
        // Validar a data
    
        guard let dateFormatted = dateFormatted else {
            self.uiState = .error("Data inválida \(birthday)")
            return
        }
        
        // Date -> yyyy-MM-dd
        
        formatter.dateFormat = "yyyy-MM-dd"
        let birthday = formatter.string(from: dateFormatted)
        
        
        WebService.postUser(request: SignUpRequest(fullName: fullName, 
                                                   email: email,
                                                   password: password,
                                                   document: document,
                                                   phone: phone, 
                                                   gender: gender.index,
                                                   birthday: birthday))
    }
}

extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
