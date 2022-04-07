//
//  AppDelegate.swift
//  AJob
//
//  Created by Lisette Antigua on 2/10/22.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
   // Database.database().isPersistenceEnabled = true
    return true
  }
}

