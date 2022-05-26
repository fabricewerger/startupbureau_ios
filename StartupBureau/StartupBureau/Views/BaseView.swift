//
//  BaseView.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 03/12/2021.
//

import SwiftUI

class MenuSettings: ObservableObject {
    @Published var show: Bool = false
}

struct BaseView: View {
    
    @StateObject var menuSettings = MenuSettings()
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab = "Home"
    
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let sideBarWidth = getRect().width - 90
        
        NavigationView{
            
            HStack {
                
                SideMenu()
                
                VStack {
                    TabView(selection: $currentTab){
                        Home()
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .navigationBarTitle("")
                            .tag("Home")
                    }
                }
                .frame(width: getRect().width)
                .overlay(
                    Rectangle()
                        .fill(
                            
                            Color.primary
                                .opacity(Double((offset / sideBarWidth) / 5))
                        )
                        .ignoresSafeArea(.container, edges: .vertical)
                        .onTapGesture {
                            withAnimation{
                                menuSettings.show.toggle()
                            }
                        }
                )
            }
            
            .frame(width: getRect().width + sideBarWidth)
            .offset(x: -sideBarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
            )
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
            .navigationTitle("")
        }
        .environmentObject(menuSettings)
        .animation(.easeOut, value: offset == 0)
        .onChange(of: menuSettings.show) { newValue in
            
            if menuSettings.show && offset == 0{
                offset = sideBarWidth
                lastStoredOffset = offset
            }
            
            if !menuSettings.show && offset == sideBarWidth{
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
        
        
    }
    
    func onChange(){
        let sideBarWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? ((gestureOffset + lastStoredOffset) < sideBarWidth ? (gestureOffset + lastStoredOffset) : offset) : offset
        
        offset = (gestureOffset + lastStoredOffset) > 0 ? offset : 0
    }
    
    func onEnd(value: DragGesture.Value){
        
        let sideBarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation{
            if translation > 0{
                
                if translation > (sideBarWidth / 2){
                    
                    offset = sideBarWidth
                    menuSettings.show = true
                }
                else{
                    
                    if offset == sideBarWidth || menuSettings.show{
                        return
                    }
                    offset = 0
                    menuSettings.show = false
                }
            }
            else{
                
                if -translation > (sideBarWidth / 2){
                    offset = 0
                    menuSettings.show = false
                }
                else{
                    
                    if offset == 0 || !menuSettings.show{
                        return
                    }
                    
                    offset = sideBarWidth
                    menuSettings.show = true
                }
            }
        }
        
        lastStoredOffset = offset
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
