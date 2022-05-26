//
//  CourseBuyConfirmationView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 08/12/2021.
//

import SwiftUI

struct CourseBuyConfirmationView: View {
    
    @EnvironmentObject var menuSettings: MenuSettings
    
    @Binding var homeNavigationFlow: Bool
    
    
    var body: some View {
        VStack(alignment: .center){
            Image("checkmark")
            
            Text("Bestelling geslaagd!")
                .multilineTextAlignment(.center)
                .font(.system(size: 25, weight: .semibold, design: .default))
            
            Text("Je gekochte businessplan staan meteen voor je klaar op de home pagina.")
                .multilineTextAlignment(.center)
                .font(.system(size: 15, weight: .regular, design: .default))
                .padding()
            
            Text("Over de aanvullende diensten wordt zo spoedig mogelijk contact met je opgenomen.")
                .multilineTextAlignment(.center)
                .font(.system(size: 15, weight: .regular, design: .default))
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)
            
            Button("Terug naar home") {
                self.homeNavigationFlow = false
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        
    }
}

struct CourseBuyConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        CourseBuyConfirmationView(homeNavigationFlow: .constant(false))
    }
}
