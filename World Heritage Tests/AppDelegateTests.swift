//
//  AppDelegateTests.swift
//  World Heritage
//
//  Created by James Hildensperger on 4/15/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//


//import WHS_β

class AppDelegateTests: QuickSpec {
    override func spec() {
        describe("When the app did finish launching with options") {
//            let appDelegate = AppDelegate()
//            appDelegate.hidden.should
            
            it("should set the bools") {
//                expect(appDelegate.visible).to(beTrue())
                
                let appDelegate = UIApplication.sharedApplication().delegate! as! AppDelegate
                
//                appDelegate.application!(UIApplication(), didFinishLaunchingWithOptions: nil)
                
                expect(appDelegate.visible).to(beFalse())
            }
        }
    }
}