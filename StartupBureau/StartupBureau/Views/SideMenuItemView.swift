//
//  SideMenuItemView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 11/01/2022.
//

import SwiftUI

struct SideMenuItemView: View {
    
    let title: String
    let image: String
    
    var body: some View {
        
        HStack(spacing: 10){
            
            Image(image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fill)
                .frame(width: 22, height: 22)
                .foregroundColor(.white)
            
            Text(title)
                .foregroundColor(.white)
        }
        .foregroundColor(.primary)
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct SideMenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuItemView(title: "test", image: "test")
    }
}
