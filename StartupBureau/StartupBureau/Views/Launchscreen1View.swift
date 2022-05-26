//
//  Launchscreen1.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 16/12/2021.
//

import SwiftUI

struct Launchscreen1: View {
    var body: some View {
        ZStack {
            Color.accentColor
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Text("Wat is Startup Bureau")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .padding(.top)
                    .padding(.top)
                Text("Start Up Bureau helpt (jonge) ondernemers met het beginnen van hun onderneming. Wij bieden businessplannen en coaching aan voor ondernemingen in verschillende branches. ")
                    .foregroundColor(Color.white)
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .padding()
                    .padding()
                    .multilineTextAlignment(.center)
                Image("launchscreen_1")
                  
                Text("Heb je al een account?")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                
                
            }
        }
       
    }
}

struct Launchscreen1_Previews: PreviewProvider {
    static var previews: some View {
        Launchscreen1()
    }
}
