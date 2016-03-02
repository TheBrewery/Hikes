//
//  AppDelegate.swift
//  Hikes
//
//  Created by James Hildensperger on 8/19/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import MapKit
import ObjectMapper
import FBAnnotationClusteringSwift

let RealmDataBaseDidLoadNotification = "RealmDataBaseDidLoadNotification"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let statusBarView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.ExtraLight))

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        TBLocationManager.authorize()

        customizeAppearance()

        executeOn(.Background) {
            if let path = NSBundle.mainBundle().pathForResource("sorted_sites", ofType: "json") {
                do {
                    let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
                    let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments) as! [[String: AnyObject]]

                    let _realm = try Realm()
                    try jsonResult.generate().forEach({ (dictionary) -> () in
                        try _realm.write({
                            _realm.create(Site.self, value: Mapper<Site>().map(dictionary)!, update: true)
                        })
                    })

                    executeOn(.Main) {
                        NSNotificationCenter.defaultCenter().postNotificationName(RealmDataBaseDidLoadNotification, object: nil)
                    }
                } catch {
                    print("LOAD ERROR")
                }
            }
        }

        return true
    }

    func customizeAppearance() {
        statusBarView.frame = UIApplication.sharedApplication().statusBarFrame
        window?.addSubview(statusBarView)

        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont.regularFontOfSize(11.0)], forState: UIControlState.Normal)
        UITabBar.appearance().tintColor = UIColor.whDarkBlueColor()

        FBAnnotationClusterView.appearance().font = UIFont.semiboldFontOfSize(16.0)
        FBAnnotationClusterView.appearance().colors = [UIColor.whDarkBlueColor(), UIColor.whDarkBlueColor().lighterColorForColor(0.1)]
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

