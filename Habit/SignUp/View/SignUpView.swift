//
//  SignUpView.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    

    
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Cadastro")
                            .foregroundStyle(Color("textColor"))
                            .font(Font.system(.title).bold())
                            .padding(.bottom, 8)
                        
                        fullNameField
                        emailField
                        passwordField
                        phoneField
                        documentField
                        birthdayField
                        genderField
                        saveButton
                    }
                    Spacer()
                }
                .padding(.horizontal, 12)
                
            }
            .padding(20)
            
            if case SignUpUIState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"),
                              message: Text(value),
                              dismissButton: .default(Text("OK")) {
                            // acao
                        })
                    }
            }
        }
    }
}

extension SignUpView {
    var fullNameField: some View {
        EditTextView(text: $viewModel.fullName,
                     placeholder: "Nome completo",
                     keyboard: .alphabet,
                     isSecure: false,
                     failure: viewModel.fullName.count < 3,
                     error: "Nome inválido")
    }
}

extension SignUpView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "Digite seu email",
                     keyboard: .emailAddress,
                     isSecure: false,
                     failure: !viewModel.email.isEmail(),
                     error: "Email inválido")
    }
}

extension SignUpView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
                     placeholder: "Digite sua senha",
                     keyboard: .emailAddress,
                     isSecure: true,
                     failure: viewModel.password.count < 8,
                     error: "Senha inválida")
    }
}

extension SignUpView {
    var phoneField: some View {
        EditTextView(text: $viewModel.phone,
                     placeholder: "Digite seu telefone",
                     keyboard: .numberPad,
                     isSecure: false,
                     failure: viewModel.phone.count != 11,
                     error: "DDD + 9 + Numbero")
    }
}

extension SignUpView {
    var documentField: some View {
        EditTextView(text: $viewModel.document,
                     placeholder: "Digite seu CPF",
                     keyboard: .numberPad,
                     isSecure: false,
                     failure: viewModel.document.count != 11,
                     error: "CPF inválido")
    }
}

extension SignUpView {
    var birthdayField: some View {
        EditTextView(text: $viewModel.birthday,
                     placeholder: "Insira sua data de nascimento",
                     keyboard: .alphabet,
                     isSecure: false,
                     failure: viewModel.birthday.count != 10,
                     error: "Data inválida")
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }
        .padding(.vertical, 26)
        .pickerStyle(SegmentedPickerStyle())
    }
}

extension SignUpView {
    var saveButton: some View {
        LoadingButtonView(action: {
            print("ola")
        },
                        nameButton: "Registre-se",
                          showProgress: self.viewModel.uiState == SignUpUIState.loading,
                          disabled: viewModel.fullName.count < 3 ||
                          !viewModel.email.isEmail() ||
                          viewModel.password.count < 8 ||
                          viewModel.phone.count != 11 ||
                          viewModel.document.count != 11 ||
                          viewModel.birthday.count != 10)
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
