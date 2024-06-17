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
                                
                                Text("Copyright @YYYY")
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
        EditTextView(text: $email,
                     placeholder: "Your email",
                     keyboard: .emailAddress,
                     failure: !email.isEmail(),
                     error: "Invalid Email")
    }
}

extension SignInView {
    var passwordField: some View {
        EditTextView(text: $password,
                     placeholder: "Your password",
                     keyboard: .emailAddress,
                     isSecure: true,
                     failure: password.count < 8,
                     error: "minimum 8 characters")
            
    }
}

extension SignInView {
    var enterButton: some View {
        LoadingButtonView(action: {
            viewModel.login(email: email, password: password)
        }, 
        nameButton: "Entrar",
        showProgress: self.viewModel.uiState == SignInUIState.loading,
        disabled: !email.isEmail() || password.count < 8)
        
    }
}

extension SignInView {
    var registerLink: some View {
        VStack {
            Text("Ainda não possui login ativo?")
                .foregroundStyle(.gray)
                .padding(.top, 48)
            
            NavigationLink {
                viewModel.singUpView()
            } label: {
                Text("Registre-se")
            }
        }
    }
}


#Preview {
    SignInView(viewModel: SignInViewModel())
}
