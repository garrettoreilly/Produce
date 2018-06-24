//
//  AppDelegate.swift
//  Produce
//
//  Created by Garrett Oreilly on 2018-06-21.
//  Copyright © 2018 Garrett Oreilly. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow()
        window?.makeKeyAndVisible()
        
        let myNewsTableViewController = NewsTableViewController()
        myNewsTableViewController.navigationItem.title = "My News"
        let myNewsNavigationController = UINavigationController(rootViewController: myNewsTableViewController)
        myNewsNavigationController.navigationBar.barStyle = .black
        myNewsNavigationController.tabBarItem = UITabBarItem(title: "My News", image: nil, selectedImage: nil)
        
        let allNewsTableViewController = NewsTableViewController()
        allNewsTableViewController.navigationItem.title = "All News"
        let allNewsNavigationController = UINavigationController(rootViewController: allNewsTableViewController)
        allNewsNavigationController.navigationBar.barStyle = .black
        allNewsNavigationController.tabBarItem = UITabBarItem(title: "All News", image: nil, selectedImage: nil)
        
        let settingsTableViewController = MenuTableViewController(style: .grouped)
        settingsTableViewController.navigationItem.title = "Settings"
        let settingsNavigationController = UINavigationController(rootViewController: settingsTableViewController)
        settingsNavigationController.navigationBar.barStyle = .black
        settingsNavigationController.tabBarItem = UITabBarItem(title: "Settings", image: nil, selectedImage: nil)
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barStyle = .black
        tabBarController.viewControllers = [myNewsNavigationController, allNewsNavigationController, settingsNavigationController]
        tabBarController.selectedViewController = myNewsNavigationController
        
        window?.rootViewController = tabBarController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

