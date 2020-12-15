//
//  Nikolaos_SwiftUIApp.swift
//  Nikolaos_SwiftUI
//
//  Created by Yoshikawa Ayano on 2020/12/13.
//

import SwiftUI
import Foundation
import Firebase

var db: Firestore!

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("start delegate\n")
        FirebaseApp.configure()
        print("finish delegate\n")
        return true
    }
    
    // 必要に応じて処理を追加
}


@main
struct Nikolaos_SwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
 
}

struct Nikolaos_SwiftUIApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }

    
}







