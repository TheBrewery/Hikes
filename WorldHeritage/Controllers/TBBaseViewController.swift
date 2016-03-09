//
//  UIViewController+WorldHeritage.swift
//  World Heritage
//
//  Created by James Hildensperger on 2/19/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

enum TBBlurredStatusBarStyle {
    case NoneDefault
    case LightDefault
    case ExtraLightDefault
    case DarkDefault
    
    case NoneLightContent
    case LightLightContent
    case ExtraLightLightContent
    case DarkLightContent
}

class TBBaseViewController: UIViewController  {
    var preferredBlurredStatusBarStyleBarStyle: TBBlurredStatusBarStyle = .NoneDefault {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func setNeedsStatusBarAppearanceUpdate() {
        updateBlurredStatusBarStyleBarStyle()
        super.setNeedsStatusBarAppearanceUpdate()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        switch preferredBlurredStatusBarStyleBarStyle {
            case .NoneDefault, .ExtraLightDefault, .LightDefault, .DarkDefault: return .Default
            case .NoneLightContent, .ExtraLightLightContent, .LightLightContent, .DarkLightContent: return .LightContent
        }
    }
    
    // MARK: - Private 
    
    private func updateBlurredStatusBarStyleBarStyle() {
        let statusBarView = (UIApplication.sharedApplication().delegate as! AppDelegate).statusBarView
        statusBarView.superview?.bringSubviewToFront(statusBarView)
        switch preferredBlurredStatusBarStyleBarStyle {
        case .NoneDefault, .NoneLightContent:
            statusBarView.hidden = true
            break
        case .ExtraLightDefault, .ExtraLightLightContent:
            statusBarView.hidden = false
            statusBarView.effect = UIBlurEffect(style: .ExtraLight)
            break
        case .LightDefault, .LightLightContent:
            statusBarView.hidden = false
            statusBarView.effect = UIBlurEffect(style: .Light)
            break
        case .DarkDefault, .DarkLightContent:
            statusBarView.hidden = false
            statusBarView.effect = UIBlurEffect(style: .Dark)
            break
        }
        
    }
}