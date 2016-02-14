
import UIKit

class TLCircularIconButton: UIControl {
    private var borderWidth: CGFloat = 0.0
    private let titleLabel = UILabel()
    
    private let backgroundView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureForFrame()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        configureForFrame()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    convenience init(icon: FontAwesome, frame: CGRect, target: AnyObject?, action: Selector, startColor start: UIColor? = nil, endColor end: UIColor? = nil) {
        self.init(frame: frame)
        self.icon = icon
        self.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        //        TODO clean this up
        //        if let start = start {
        //            startColor = start
        //        }
        //
        //        if let end = end {
        //            endColor = end
        //        }
        
        //        gradientLayer.removeFromSuperlayer()
        //        gradientLayer = TLBaseGradientLayer(startColor: startColor, endColor: endColor)
        //        gradientLayer.frame = titleLabel.frame
        //        backgroundView.layer.addSublayer(gradientLayer)
    }
    
    var icon: FontAwesome? {
        get {
            guard let text = titleLabel.text else {
                return nil
            }
            return FontAwesome(rawValue: text)
        } set {
            titleLabel.text = newValue?.rawValue
        }
    }
    
    override var highlighted: Bool {
        didSet {
            if self.highlighted {
                backgroundColor = UIColor.tbLightGreenColor().lighterColorForColor()
                layer.shadowColor = UIColor.blackColor().CGColor
                layer.shadowRadius = 2.0
                layer.shadowOffset = CGSize(width: 0, height: 1)
                layer.shadowOpacity = 0.75
            } else {
                backgroundColor = UIColor.tbLightGreenColor()
                layer.shadowColor = UIColor.blackColor().CGColor
                layer.shadowRadius = 2.0
                layer.shadowOffset = CGSize(width: 0, height: 1)
                layer.shadowOpacity = 0.4
            }
        }
    }
    
    // MARK: - Private
    
    private func initialize() {
        titleLabel.font = UIFont.iconicFontOfSize(20.0)
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.clipsToBounds = true
        
        addSubview(backgroundView)
        
        backgroundColor = nil
        addSubview(titleLabel)
        
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowRadius = 2.0
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowOpacity = 0.4
    }
    
    private func configureForFrame() {
        titleLabel.frame = CGRectMake(borderWidth, borderWidth, frame.width - 2 * borderWidth, frame.width - 2 * borderWidth)
        titleLabel.layer.cornerRadius = titleLabel.frame.width/2.0
        
        backgroundView.frame = titleLabel.frame
        
        backgroundView.layer.cornerRadius = titleLabel.frame.width/2.0
        backgroundView.clipsToBounds = true
        backgroundView.userInteractionEnabled = false
    }
}
