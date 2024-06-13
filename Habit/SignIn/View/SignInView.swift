//
//  SignInView.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        ZStack {
        
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationStack {
                    
                    ScrollView {
                        
                        VStack(alignment: .center ,spacing: 20) {
                            
                            Spacer(minLength: 56)
                            
                            VStack(alignment: .center, spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 48)
                                
                                Text("Login")
                                    .foregroundStyle(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)
                                
                                
                                emailField
                                passwordField
                                enterButton
                                registerLink
                                
                                Text("Copyright @Kaic.Dev")
                                    .foregroundStyle(.gray)
                                    .font(Font.system(size: 16))
                                    .padding(.top, 36)
                            }
                        }
                        if case SignInUIState.error(let value) = viewModel.uiState {
                            Text("")
                                .alert(isPresented: .constant(true)) {
                                    Alert(title: Text("Habit"),
                                          message: Text(value),
                                          dismissButton: .default(Text("Ok")) {
                                            // Ação
                                    })
                                }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .navigationTitle("Login")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar(.hidden)
                }
            }
        }
    }
}

extension SignInView {
    var emailField: some View {
        TextField("Email", text: $email)
            .border(.black)
    
    }
}

extension SignInView {
    var passwordField: some View {
        SecureField("Password", text: $password)
            .border(.black)
            
    }
}

extension SignInView {
    var enterButton: some View {
        Button("Entrar") {
            viewModel.login(email: email, password: password)
        }
        .foregroundStyle(.black)
        .padding(.horizontal, 50)
        .background(.orange)
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Ainda não possui login ativo?")
                .foregroundStyle(.gray)
                .padding(.top, 48)
            
            ZStack {
                NavigationLink {
                    Text("Tela de Cadastro")
                } label: {
                    Text("Register")
                }
            }
        }
    }
}


#Preview {
    SignInView(viewModel: SignInViewModel())
}
