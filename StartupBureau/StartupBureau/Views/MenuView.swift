//
//  MenuView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 21/11/2021.
//

import SwiftUI

struct MenuView: View {
    
    @State private var baseBlue: String = "#0A1256"
    @State private var willMoveToNextScreen = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "house")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    NavigationLink(destination: TestView()) {
                        Text("Home")
                        Button("Button title") {
                            print("Button tapped!")
                        }
                        .foregroundColor(.white)
                        .font(.headline)
                    }
                }
                .padding(.top, 120)
//                .navigate(to: TestView(), when: $willMoveToNextScreen)
                
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Profiel")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.top, 30)
                HStack {
                    Image(systemName: "bubble.left.and.bubble.right")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Coaching")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.top, 30)
                HStack {
                    Image(systemName: "return.left")
                        .foregroundColor(.white)
                        .imageScale(.large)
                    Text("Uitloggen")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .padding(.top, 90)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 32/255, green: 32/255, blue: 85/255))
            .edgesIgnoringSafeArea(.all)
        }.navigationBarHidden(false)
    }
}


struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
