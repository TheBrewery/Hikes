//
//  FirstViewController.swift
//  Hikes
//
//  Created by James Hildensperger on 8/19/15.
//  Copyright (c) 2015 The Brewery. All rights reserved.
//

import UIKit
import RealmSwift
import AlamofireImage

let hikesGreen = UIColor(red:0.28, green:0.56, blue:0, alpha:1)

enum TBAnimatingSearchBarState {
    case Expanded
    case Collapsed
    case Floating
}

private let placeholderOffsetX: CGFloat = 4.0
private let viewHeight: CGFloat = 50.0

class TBAnimatingSearchBar: UIView {
    class TBTextField: UITextField {
        override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
            return CGRectInset(bounds, placeholderOffsetX, 0)
        }
    }
    
    class TBControl: UIControl {
        override var highlighted: Bool {
            didSet {
                UIView.animateWithDuration(0.25) {
                    self.backgroundColor = UIColor(white: self.highlighted ? 0.9 : 1.0, alpha: 1.0)
                }
            }
        }
    }
    
    var statusBarView: UIView!
    var iconLabel: UILabel!
    var backgroundView: TBControl!
    var textField: TBTextField!
    
    private var respondsToContentOffset = true
    
    var cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .White)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        statusBarView = UIView(frame: UIApplication.sharedApplication().statusBarFrame)
        statusBarView.backgroundColor = UIColor.whiteColor()
        
        backgroundView = TBControl(frame: CGRect(x: 20, y: 40, width: frame.width - 40, height: viewHeight) )
        backgroundView.layer.cornerRadius = 3
        backgroundView.backgroundColor = UIColor.whiteColor()

        backgroundView.addTarget(self, action: "didTap", forControlEvents: .TouchUpInside)
        backgroundView.layer.shadowColor = UIColor.blackColor().CGColor
        backgroundView.layer.shadowRadius = 2.0
        backgroundView.layer.shadowOffset = CGSize(width: 0, height: 1)
        backgroundView.layer.shadowOpacity = 0.16
        
        cancelButton.setTitle("Cancel", forState: .Normal)
        cancelButton.setTitleColor(UIColor.darkTextColor(), forState: .Normal)
        cancelButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)!
        cancelButton.addTarget(self, action: "didTapCancelButton", forControlEvents: .TouchUpInside)
        cancelButton.center = CGPoint(x: frame.width - cancelButton.frame.width/2.0, y: backgroundView.frame.height/2.0)
        cancelButton.alpha = 0
        
        iconLabel = UILabel(frame: CGRect(x: 0, y: 0, width: backgroundView.frame.height, height: backgroundView.frame.height))
        iconLabel.font = UIFont(name: "FontAwesome", size: 16)!
        iconLabel.text = "\u{f002}"
        iconLabel.textColor = hikesGreen
        iconLabel.textAlignment = NSTextAlignment.Center
        
        textField = TBTextField(frame: CGRect(x: iconLabel.frame.width - placeholderOffsetX, y: 0, width: backgroundView.frame.width - iconLabel.frame.height, height: backgroundView.frame.height))
        textField.font = UIFont(name: "AvenirNext-Medium", size: 16)!
        textField.attributedPlaceholder = NSAttributedString(string: "Find Your Adventure", attributes: [NSForegroundColorAttributeName: UIColor.lightGrayColor(), NSFontAttributeName: UIFont(name: "Avenir Next", size: 16)!])
        textField.tintColor = hikesGreen
        textField.textColor = hikesGreen
        textField.returnKeyType = .Search
        textField.userInteractionEnabled = false
        
        backgroundView.addSubview(iconLabel)
        backgroundView.addSubview(textField)
        backgroundView.addSubview(cancelButton)
        
        addSubview(backgroundView)
        addSubview(statusBarView)
        addSubview(activityIndicator)
    }
    
    func didTap() {
        barState = .Expanded
    }
    
    func didTapCancelButton() {
        self.textField.userInteractionEnabled = false
        self.textField.text = nil
        
        barState = previousBarState
    }
    
    // MARK: - Public
    
    func contentOffsetDidChange(contentOffset: CGPoint) {
        guard respondsToContentOffset else {
            return
        }
        
        if contentOffset.y > 30 {
            barState = .Collapsed
        } else {
            barState = .Floating
        }
    }

    func animateSizeForState(barState: TBAnimatingSearchBarState) {
        guard barState != .Expanded else {
            UIView.animateKeyframesWithDuration(0.35, delay: 0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.75) {
                    self.textField.alpha = 1.0
                    self.backgroundView.frame = CGRect(x: 0, y: 20, width: UIScreen.mainScreen().bounds.width, height: viewHeight)
                    self.backgroundView.layer.cornerRadius = 0
                    
                    self.iconLabel.transform = CGAffineTransformMakeScale(0.5, 0.5)
                    self.iconLabel.alpha = 0
                    
                    self.textField.frame.origin.x = 10
                }
                
                UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25) {
                    self.cancelButton.alpha = 1
                }
                
                }) { (finished) -> Void in
                    self.textField.userInteractionEnabled = true
                    self.textField.becomeFirstResponder()
            }
            return
        }

        let expand = barState == .Floating
        
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fromValue = expand ? viewHeight/2.0 : 3.0
        animation.toValue = expand ? 3.0 : viewHeight/2.0
        animation.duration = 0.15
        backgroundView.layer.addAnimation(animation, forKey: "cornerRadius")
        backgroundView.layer.cornerRadius = animation.toValue as! CGFloat
        self.cancelButton.alpha = 0

        UIView.animateWithDuration(0.15, animations: { () -> Void in
            self.iconLabel.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.iconLabel.alpha = 1.0
            
            let width = expand ? self.frame.width - 40 : viewHeight
            self.backgroundView.frame = CGRect(x: 20, y: 40, width: width, height: viewHeight)
            self.textField.frame.origin.x = self.iconLabel.frame.maxX - placeholderOffsetX
            self.textField.alpha = CGFloat(expand)
            }, completion: nil)
    }
    
    private var previousBarState: TBAnimatingSearchBarState = .Floating
    
    var barState: TBAnimatingSearchBarState = .Floating {
        willSet {
            previousBarState = barState
        } didSet {
            guard previousBarState != barState else {
                return
            }
            respondsToContentOffset = barState != .Expanded
            animateSizeForState(barState)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class HikeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var rightLabel: UILabel?
}

class HikesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let HikeCollectionViewCellIdentifier = "HikeCollectionViewCell"
    var animatingSearchBar: TBAnimatingSearchBar!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatingSearchBar = TBAnimatingSearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        view.addSubview(animatingSearchBar)
        
        navigationController?.navigationBarHidden = true
    }
    
    // Mark - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.bounds.width, 220)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        do {
            return try Realm().objects(Hike).count
        } catch {
            return 0
        }
    }
        
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HikeCollectionViewCellIdentifier, forIndexPath: indexPath) as! HikeCollectionViewCell
        
        do {
            let hike = try Realm().objects(Hike)[indexPath.row]
            cell.titleLabel!.text = hike.name
            cell.subtitleLabel!.text = hike.locality
            cell.rightLabel!.text = String(format: "%.1f mi", hike.distance/1.6)
            
            if let url = hike.images.first?.urlForImageSize(.Medium) {
                cell.imageView?.af_setImageWithURL(url, placeholderImage: UIImage(named:"the-narrows")!)
            }
            
            cell.contentView.backgroundColor = UIColor.purpleColor()
        } catch {
            return cell
        }
        
        return cell
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        animatingSearchBar.contentOffsetDidChange(scrollView.contentOffset)
    }
}

