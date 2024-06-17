//
//  LoadingButtonView.swift
//  Habit
//
//  Created by Kaic Cesar on 17/06/24.
//

import SwiftUI

struct LoadingButtonView: View {
    
    
    var action: () -> Void
    var nameButton: String
    var showProgress: Bool = false
    var disabled: Bool = false
    
    var body: some View {
        ZStack {
            Button(action: {
                action()
            }, label: {
                Text(showProgress ? " " : nameButton)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(Font.system(.title3).bold())
                    .background(disabled ? Color("lightOrange") : .orange)
                    .foregroundStyle(.white)
                    .cornerRadius(4.0)
            }).disabled(disabled || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }
    }
}

#Preview {
    LoadingButtonView(action: {
        print("Ola mundo")
    }, nameButton: "Entrar",
    showProgress: false,
    disabled: false
    )
    .padding()
}
