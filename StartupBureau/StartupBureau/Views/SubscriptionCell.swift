//
//  SubscriptionCell.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 11/12/2021.
//

import SwiftUI
import URLImage

struct SubscriptionCell: View {
    let subscription: CourseSubscriptionsProperties
    
    var body: some View {
        ZStack{
            Image("blue")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
            
            Text("\(subscription.currentStepNumber)")
                .foregroundColor(.white)
                .offset(x: 55)
            
            Text("title")
                .foregroundColor(.white)
                .offset(x: -55)
            
        }.clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct SubscriptionCell_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
