//
//  Twitter_SwiftUIApp.swift
//  Twitter SwiftUI
//
//  Created by loratech on 01/01/24.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct TwitterApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
    //    init(){
    //        FirebaseApp.configure()
    //    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
//                ProfilePhotoSelectorView()
            }
            .environmentObject(viewModel)
        }
    }
}
