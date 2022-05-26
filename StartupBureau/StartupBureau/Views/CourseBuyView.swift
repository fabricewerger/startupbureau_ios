//
//  CourseBuyView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 08/12/2021.
//

import SwiftUI


struct CourseBuyView: View {
    @EnvironmentObject var menuSettings: MenuSettings
    
    @Binding var option1: Bool
    @Binding var option2: Bool
    @Binding var option3: Bool
    
    @Binding var homeNavigationFlow: Bool
    
    var body: some View {
        VStack{
            
            Image("mandje")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            
            NavigationLink {
                CourseBuyConfirmationView(homeNavigationFlow: $homeNavigationFlow)
            } label: {
                Text("Samengestelde pakket kopen")
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Spacer()
        }
    }
}

struct CourseBuyView_Previews: PreviewProvider {
    static var previews: some View {
        CourseBuyView(option1:  .constant(false), option2:  .constant(false), option3:  .constant(false), homeNavigationFlow: .constant(false))
    }
}
