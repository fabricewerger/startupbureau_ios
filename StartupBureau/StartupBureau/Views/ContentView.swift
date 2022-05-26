//
//  ContentView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 21/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    private let onboardingContentManager = OnboardingContentManagerImpl(manager: PlistManagerImpl())
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some View {
        
        LoginView()
            .fullScreenCover(isPresented: .constant(!hasSeenOnboarding),
                             content: {
                let plistManager = PlistManagerImpl()
                let manager = OnboardingContentManagerImpl(manager: plistManager)
                OnboardingScreenView(manager: manager) {
                    hasSeenOnboarding = true
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
