//
//  AppDelegate.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 06/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit
import Reachability
import TTGSnackbar

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController!
    var coordinator: MainCoordinator?
    var reachability = Reachability()!
    
    private var ignoreAppLaunchConnectionSnackBar: Bool = true
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.initializeReachability()
        
        _ = MainContainer.sharedContainer
        
        navController = UINavigationController()
        coordinator = MainCoordinator(
            navigationController: navController
        )
        coordinator?.start()
        self.configureWindow()
        self.configureNavigationBar()
        return true
    }
    
    private func configureWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
    }
    
    private func configureNavigationBar() {
        self.navController.navigationBar.prefersLargeTitles = true
    }

}

extension AppDelegate {
    
    func initializeReachability() {
        reachability.whenUnreachable = { _ in
            let snackbar = TTGSnackbar(message: "You are offline", duration: .long)
            snackbar.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            snackbar.messageTextAlign = .center
            snackbar.icon = #imageLiteral(resourceName: "offline")
            snackbar.show()
            self.ignoreAppLaunchConnectionSnackBar = false
        }
        
        reachability.whenReachable = { _ in
            if !(self.ignoreAppLaunchConnectionSnackBar) {
                let snackbar = TTGSnackbar(message: "You are online!", duration: .long)
                snackbar.icon = #imageLiteral(resourceName: "online")
                snackbar.messageTextAlign = .center
                snackbar.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
                snackbar.show()
            }
            self.ignoreAppLaunchConnectionSnackBar = false
        }
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
}
