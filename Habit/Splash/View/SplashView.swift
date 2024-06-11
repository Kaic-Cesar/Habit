//
//  SplashView.swift
//  Habit
//
//  Created by Kaic Cesar on 11/06/24.
//

import SwiftUI

struct SplashView: View {
    
    @State var uiState: SplashUIState = .loading
    
    var body: some View {
        switch uiState {
        case .loading:
            loadingView()
        case .goToSignScreen:
            Text("Tela de Login")
        case .goToHomeScreen:
            Text("Tela Principal")
        case .error(let msg):
            loadingView(error: msg)
        }
    }
}

extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(30)
                .ignoresSafeArea()
            
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"),
                              message: Text(error),
                              dismissButton: .default(Text("Ok")){
                            // Faz algo
                        })
                 }
            }
        }
    }
}

#Preview {
    SplashView()
}
