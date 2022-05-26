//
//  StartupBureauApp.swift
//  StartupBureau
//
//  Created by Fabrice Werger on 21/11/2021.
//

import SwiftUI
import Firebase

@main
struct StartupBureauApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @StateObject var sessionService = SessionServiceImpl()
    
    var body: some Scene {
        WindowGroup {
            switch sessionService.state {
            case .loggedIn:
                BaseView()
                    .environmentObject(sessionService)
            case .loggedOut:
                ContentView()
            }
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
