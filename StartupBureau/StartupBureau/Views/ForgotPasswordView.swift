//
//  ForgotPasswordView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 21/03/2022.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var viewModel = ForgotPasswordViewModelImpl(
        service: ForgotPasswordServiceImpl()
    )
    
    var body: some View {
        VStack(spacing: 16) {
            
            InputTextFieldView(text: $viewModel.email,
                               placeholder: "Email",
                               keyboardType: .emailAddress,
                               systemImage: "envelope")
            
            ButtonView(title: "Verstuur wachtwoord herstel") {
                viewModel.sendPasswordResetRequest()
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding(.horizontal, 15)
        .navigationTitle("Herstel wachtwoord")
        .applyClose()
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}

