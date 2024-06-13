//
//  SplashView.swift
//  Habit
//
//  Created by Kaic Cesar on 11/06/24.
//

import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToSignScreen:
                viewModel.singInView()
            case .goToHomeScreen:
                Text("Tela Principal")
            case .error(let msg):
                loadingView(error: msg)
            }
        }
        .onAppear(perform: {
            viewModel.onAppear()
        })
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
    SplashView(viewModel: SplashViewModel())
}
