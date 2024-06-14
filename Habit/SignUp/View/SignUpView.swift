//
//  SignUpView.swift
//  Habit
//
//  Created by Kaic Cesar on 13/06/24.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var phone = ""
    @State var document = ""
    @State var birthday = ""
    @State var gender = Gender.male
    
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Cadastro")
                            .foregroundStyle(.orange)
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
        TextField("Nome Completo", text: $fullName)
            .border(.black)
    }
}

extension SignUpView {
    var emailField: some View {
        TextField("Email", text: $email)
            .border(.black)
    }
}

extension SignUpView {
    var passwordField: some View {
        TextField("Senha", text: $password)
            .border(.black)
    }
}

extension SignUpView {
    var phoneField: some View {
        TextField("Telefone", text: $phone)
            .border(.black)
    }
}

extension SignUpView {
    var documentField: some View {
        TextField("CPF", text: $document)
            .border(.black)
    }
}

extension SignUpView {
    var birthdayField: some View {
        TextField("Data de Nascimento", text: $birthday)
            .border(.black)
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $gender) {
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

extension SignUpView {
    var saveButton: some View {
        Button("Realize o cadastro") {
            viewModel.signUp()
        }
    }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
