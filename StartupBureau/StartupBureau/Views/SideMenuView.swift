//
//  SideMenuView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 03/12/2021.
//

import SwiftUI

struct SideMenu: View {
    
    @State private var showingAlert = false
    
    @EnvironmentObject var menuSettings: MenuSettings
    @EnvironmentObject var service: SessionServiceImpl
    
    @State var homeNavigationChatFlow: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 15) {
                
                Image(asset: .profile)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                HStack {
                    Text("\(service.userDetails?.firstName ?? "n.v.t.")")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                    Text("\(service.userDetails?.lastName ?? "n.v.t.")")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
                
                Text("\(service.userDetails?.occupation ?? "n.v.t.")")
                    .font(.title2.bold())
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.leading)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 10){
                    
                    VStack(alignment: .leading, spacing: 45) {
                        
                        TabButton(title: "Profiel", image: "Profile", link: .profile)
                        
                        TabButton(title: "Coaching", image: "Topics", link: .chatroom)
                        
                        TabButton(title: "Uitloggen", image: "Ads", link: .logout)
                        
                    }
                    .accentColor(.white)
                    .padding(.horizontal)
                    .padding(.leading)
                    .padding(.top, 15)
                    
                    Divider()
                        .padding(.vertical)
                    
                }
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.accentColor
                .opacity(1)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title:String, image:String, link:SideMenuLink)->some View{
        
        switch link {
            
        case .profile:
            NavigationLink {
                ProfileView()
            } label: {
                SideMenuItemView(title: title, image: image)
            }
            
        case .chatroom:
            NavigationLink(isActive: $homeNavigationChatFlow) {
                Chatroomiew(homeNavigationChatFlow: $homeNavigationChatFlow)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
            } label: {
                SideMenuItemView(title: title, image: image)
            }
            
        case .logout:
            HStack(spacing: 10) {
                Image("Ads")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                    .foregroundColor(.white)
                    .padding(.leading,2)
                Button("Logout") {
                    
                    showingAlert = true
                }
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("Weet je zeker dat je wilt uitloggen?"),
                        message: Text("U moet dan opnieuw inloggen om bij uw gegevens te komen"),
                        primaryButton: .destructive(Text("Logout")) {
                            service.logout()
                        },
                        secondaryButton: .cancel()
                    )
                }
            }
        }
        
    }
}


struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
    
    func safeArea()->UIEdgeInsets{
        let null = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return null
        }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else{
            return null
        }
        
        return safeArea
    }
}


enum SideMenuLink {
    
    case profile
    case chatroom
    case logout
}
