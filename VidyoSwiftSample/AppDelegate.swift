//
//  AppDelegate.swift
//  VidyoSwiftSample
//
//  Created by ApiSamples on 07/07/17.
//  Copyright © 2017 ApiSamples. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var isLaunchedURLScheme: Bool = false
    var joinCode: String = ""


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window =  UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        

        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")

        if launchedBefore  {
            //Not the first time, show login screen.
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let rootController = storyboard.instantiateViewController(withIdentifier: "enterCode")

            if let window = self.window {
                window.rootViewController = rootController
            }

        }
        else {
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            //First time, open a new page view controller.
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let rootController = storyboard.instantiateViewController(withIdentifier: "enterCode")

            if let window = self.window {
                window.rootViewController = rootController
            }
        }
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        print("Launched from URL scheme")
        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        if let items = urlComponents?.queryItems as [NSURLQueryItem]?,
           (url.scheme == "nownproctor") {
            if items.first?.name == "code",
               let code = items.first?.value{
                print("URL domain is nownproctor and query key is code for which value is " + code)
                guard let rootViewController = self.window?.rootViewController as? UINavigationController else{
                    isLaunchedURLScheme = true
                    joinCode = code
                    return true
                }
                guard let viewController = rootViewController.viewControllers.last as? ViewController else{
                    guard let viewController = rootViewController.viewControllers.last as? JoinViewController else {
                        isLaunchedURLScheme = true
                        joinCode = code
                        return true
                    }
                    print("if JoinView is already opened, it should call this")
                    return true
                }
                print ("print viewcontroller is" + rootViewController.viewControllers.last!.description)
                //isLaunchedURLScheme = true
                joinCode = code
                viewController.verifyCode(code: code)
            }
        }
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

