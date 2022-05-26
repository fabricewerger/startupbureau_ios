//
//  RegistrationView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 21/03/2022.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var viewModel = RegistrationViewModelImpl(
        service: RegistrationServiceImpl()
    )
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 32) {
                
                VStack(spacing: 16) {
                    
                    InputTextFieldView(text: $viewModel.newUser.email,
                                       placeholder: "Email",
                                       keyboardType: .emailAddress,
                                       systemImage: "envelope")
                    
                    InputPasswordView(password: $viewModel.newUser.password,
                                      placeholder: "Wachtwoord",
                                      systemImage: "lock")
                    
                    Divider()
                    
                    InputTextFieldView(text: $viewModel.newUser.firstName,
                                       placeholder: "Voornaam",
                                       keyboardType: .namePhonePad,
                                       systemImage: nil)
                    
                    InputTextFieldView(text: $viewModel.newUser.lastName,
                                       placeholder: "Achternaam",
                                       keyboardType: .namePhonePad,
                                       systemImage: nil)
                    
                    InputTextFieldView(text: $viewModel.newUser.occupation,
                                       placeholder: "Werkveld",
                                       keyboardType: .namePhonePad,
                                       systemImage: nil)
                }
                
                ButtonView(title: "Aanmelden") {
                    viewModel.create()
                }
            }
            .padding(.horizontal, 15)
            .navigationTitle("Registreren")
            .applyClose()
            .alert(isPresented: $viewModel.hasError,
                   content: {
                
                if case .failed(let error) = viewModel.state {
                    return Alert(
                        title: Text("Error"),
                        message: Text(error.localizedDescription))
                } else {
                    return Alert(
                        title: Text("Error"),
                        message: Text("Er gaat wat fout."))
                }
            })
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

