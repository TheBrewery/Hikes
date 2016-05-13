//
//  TBDropDownMenu.swift
//  World Heritage
//
//  Created by James Hildensperger on 3/10/16.
//  Copyright © 2016 The Brewery. All rights reserved.
//

import Foundation
import UIKit

class TBDropDownMenu: UIView {
    lazy var mainMenuButton: UIButton = {
        let button = UIButton(frame: CGRect(x: self.bounds.width - 50 - self.margin, y: 36, width: 50, height: 50))
        button.addTarget(self, action: #selector(TBDropDownMenu.didTapMainMenuButton), forControlEvents: .TouchUpInside)
        button.setAttributedTitle(Ionic.IosPlusEmpty.attributedStringWithFontSize(30.0), forState: .Normal)
        button.backgroundColor = UIColor.whiteColor()
        button.layer.shadowOffset = CGSize(width: 0, height: 1)
        button.layer.shadowOpacity = 0.16
        button.layer.cornerRadius = 25.0
        return button
    }()

    var margin: CGFloat = 10.0

    var isShowing = false {
        didSet {
            if isShowing {
                for button in self.menuButtons {
                    button.center = self.mainMenuButton.center
                    button.hidden = false
                    button.layer.shadowOpacity = 0.16
                }

                UIView.animateWithDuration(0.15, animations: { () -> Void in
                    self.mainMenuButton.layer.transform = CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, 1)
                    }, completion: { (fin) -> Void in

                })

                UIView.animateWithDuration(0.2, delay: 0.15, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.85, options: .CurveEaseInOut, animations: { () -> Void in
                    for (index, button) in self.menuButtons.enumerate() {
                        if index == 0 {
                            button.center.y = self.mainMenuButton.frame.maxY + button.frame.height/2.0 + self.margin
                        } else {
                            button.center.y = self.menuButtons[index - 1].frame.maxY + button.frame.height/2.0 + self.margin
                        }
                    }
                    }, completion: { (finished) -> Void in

                })

            } else {
                UIView.animateWithDuration(0.15, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.3, options: .CurveEaseInOut, animations: { () -> Void in
                    for button in self.menuButtons {
                        button.center = self.mainMenuButton.center
                        button.layer.shadowOpacity = 0
                    }
                    }, completion: { (finished) -> Void in

                })

                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.mainMenuButton.layer.transform = CATransform3DIdentity
                    }, completion: { (finished) -> Void in
                        for button in self.menuButtons {
                            button.hidden = true
                        }
                })
            }
        }
    }

    private var menuButtons = [UIButton]()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        guard isShowing else {
            return mainMenuButton.frame.contains(point)
        }

        let count = menuButtons.filter {
            $0.frame.contains(point)
            }.count
        return mainMenuButton.frame.contains(point) ||  Bool(count)
    }

    init(view: UIView, buttons: [UIButton]? = nil) {
        super.init(frame: view.bounds)
        addSubview(mainMenuButton)
        view.addSubview(self)

        guard let buttons = buttons else {
            return
        }

        for button in buttons {
            addMenuButton(button)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public

    func menuButtonAtIndex(index: NSInteger) -> UIButton? {
        return menuButtons[index]
    }

    func addMenuButton(button: UIButton) {
        button.hidden = true
        insertSubview(button, belowSubview: mainMenuButton)
        menuButtons.append(button)
    }

    // MARK: - Private

    @objc private func didTapMainMenuButton() {
        isShowing = !isShowing
    }

    @objc private func didTapVisualEffectsViewButton() {
        isShowing = false
    }
}
