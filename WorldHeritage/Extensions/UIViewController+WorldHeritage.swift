//
//  UIViewController+WorldHeritage.swift
//  World Heritage
//
//  Created by James Hildensperger on 2/19/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

enum UIBlurredStatusBarStyle {
    case NoneDefault
    case NoneLightContent
    case ExtraLightDefault
    case LightDefault
    case DarkLightContent
}

class TBBaseViewController: UIViewController  {
    var preferredBlurredStatusBarStyleBarStyle: UIBlurredStatusBarStyle = .NoneDefault {
        didSet {
            let statusBarView = (UIApplication.sharedApplication().delegate as! AppDelegate).statusBarView
            statusBarView.superview?.bringSubviewToFront(statusBarView)
            switch preferredBlurredStatusBarStyleBarStyle {
            case .NoneDefault, .NoneLightContent:
                statusBarView.hidden = true
                break
            case .ExtraLightDefault:
                statusBarView.hidden = false
                statusBarView.effect = UIBlurEffect(style: .ExtraLight)
                break
            case .LightDefault:
                statusBarView.hidden = false
                statusBarView.effect = UIBlurEffect(style: .Light)
                break
            case .DarkLightContent:
                statusBarView.hidden = false
                statusBarView.effect = UIBlurEffect(style: .Dark)
                break
            }
            
            
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        switch preferredBlurredStatusBarStyleBarStyle {
            case .NoneDefault, .ExtraLightDefault, .LightDefault: return .Default
            case .NoneLightContent, .DarkLightContent: return .LightContent
        }
    }
}