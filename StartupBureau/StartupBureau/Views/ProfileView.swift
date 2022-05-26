//
//  ProfileView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 17/01/2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var service: SessionServiceImpl
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                Image("me14")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .padding(.bottom, 50)
                
                Text("Voornaam: \(service.userDetails?.firstName ?? "n.v.t.")")
                Text("Achternaam: \(service.userDetails?.lastName ?? "n.v.t.")")
                Text("Werkveld: \(service.userDetails?.occupation ?? "n.v.t.")")
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
