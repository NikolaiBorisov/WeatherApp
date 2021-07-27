//
//  AppDelegate.swift
//  TestTaskiOSJunior
//
//  Created by NIKOLAI BORISOV on 25.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupNavBar()
        return true
    }
    
    private func setupNavBar() {
        let appearance = UINavigationBar.appearance()
        appearance.barTintColor = .systemTeal
        appearance.isTranslucent = false
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "Avenir Next Medium", size: 20) ?? UIFont.systemFont(ofSize: 20)
        ]
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.systemTeal],
            for: .normal
        )
    }
    
}
