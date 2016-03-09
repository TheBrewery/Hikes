import UIKit

enum TBAnimatingSearchBarState {
    case Expanded
    case Collapsed
    case Floating
}

private let placeholderOffsetX: CGFloat = 4.0
private let viewHeight: CGFloat = 50.0

class TBAnimatingSearchBar: UIView, UITextFieldDelegate {
    class TBTextField: UITextField {
        override func placeholderRectForBounds(bounds: CGRect) -> CGRect {
            return CGRectInset(bounds, placeholderOffsetX, 0)
        }
    }
    
    class TBControl: UIControl {
//        private let backgroundView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
//        
//        private func commonInit() {
//            backgroundView.frame = frame
//            addSubview(backgroundView)
//        }
//        
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            commonInit()
//        }
//
//        required init?(coder aDecoder: NSCoder) {
//            super.init(coder: aDecoder)
//            commonInit()
//        }
        
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
    
    var stateChangeDidComplete: ((TBAnimatingSearchBarState) -> ())?
    var textDidChange: ((String) -> ())?
    
    private var respondsToContentOffset = true
    
    var cancelButton = UIButton(frame: CGRect(x: 0, y: 0, width: 80, height: 44))
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .White)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        iconLabel.textColor = UIColor.whDarkBlueColor()
        iconLabel.attributedText = Ionic.IosSearch.attributedStringWithFontSize(20)
        iconLabel.textAlignment = NSTextAlignment.Center
        
        textField = TBTextField(frame: CGRect(x: iconLabel.frame.width - placeholderOffsetX, y: 0, width: backgroundView.frame.width - iconLabel.frame.height, height: backgroundView.frame.height))
        textField.font = UIFont(name: "AvenirNext-Medium", size: 16)!
        textField.attributedPlaceholder = NSAttributedString(string: "Find Your Adventure", attributes: [NSForegroundColorAttributeName: UIColor.lightGrayColor(), NSFontAttributeName: UIFont(name: "Avenir Next", size: 16)!])
        textField.tintColor = UIColor.whDarkBlueColor()
        textField.textColor = UIColor.whDarkBlueColor()
        textField.returnKeyType = .Search
        textField.userInteractionEnabled = false
        textField.delegate = self
        
        backgroundView.addSubview(iconLabel)
        backgroundView.addSubview(textField)
        backgroundView.addSubview(cancelButton)
        
        addSubview(backgroundView)
        addSubview(activityIndicator)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldTextDidChange:", name: UITextFieldTextDidChangeNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func textFieldTextDidChange(notification: NSNotification) {
        if let textField = notification.object as? UITextField where textField == self.textField {
            self.textDidChange?(textField.text!)
        }
    }
    
    func didTap() {
        barState = .Expanded
    }
    
    func didTapCancelButton() {
        self.textField.userInteractionEnabled = false
        self.textField.text = nil
        executeOn(.Main, afterDelay: 0.5) {[weak self] Void in
            guard let _self = self else {
                return
            }
            _self.textDidChange?("")
        }
        
        barState = previousBarState
    }
    
    // MARK: - Public
    
    func contentOffsetDidChange(contentOffset: CGPoint) {
        guard respondsToContentOffset else {
            return
        }
        barState = contentOffset.y > 30 ? .Collapsed : .Floating
    }
    
    func animateSizeForState(barState: TBAnimatingSearchBarState) {
        self.stateChangeDidComplete?(barState)
        
        guard barState != .Expanded else {
            UIView.animateKeyframesWithDuration(0.35, delay: 0, options: UIViewKeyframeAnimationOptions.CalculationModeCubic, animations: {
                UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.75) {
                    self.backgroundView.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: viewHeight + 20)
                    self.backgroundView.layer.cornerRadius = 0
                    
                    self.iconLabel.frame.origin.y = 20
                    self.iconLabel.transform = CGAffineTransformMakeScale(0.5, 0.5)
                    self.iconLabel.alpha = 0
                    
                    self.textField.frame.origin = CGPoint(x: 10, y: 20)
                    self.textField.alpha = 1.0
                    
                    self.cancelButton.frame.origin.y = 20
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
        animation.fromValue = backgroundView.layer.cornerRadius
        animation.toValue = expand ? 3.0 : viewHeight/2.0
        animation.duration = 0.15
        backgroundView.layer.addAnimation(animation, forKey: "cornerRadius")
        backgroundView.layer.cornerRadius = animation.toValue as! CGFloat
        self.cancelButton.alpha = 0
        
        UIView.animateWithDuration(0.15, animations: { () -> Void in
            self.iconLabel.transform = CGAffineTransformMakeScale(1.0, 1.0)
            self.iconLabel.alpha = 1.0
            self.iconLabel.frame.origin.y = 0

            let width = expand ? self.frame.width - 40 : viewHeight
            
            self.backgroundView.frame = CGRect(x: 20, y: 40, width: width, height: viewHeight)
            self.textField.frame.origin = CGPoint(x: self.iconLabel.frame.maxX - placeholderOffsetX, y: 0)
            self.textField.alpha = CGFloat(expand)
            
            self.cancelButton.frame.origin.y = 0
            }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}