
import UIKit

class TBCircularIconButton: UIControl {
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

    var iconColor = UIColor.whDarkBlueColor() {
        didSet {
            titleLabel.textColor = iconColor
        }
    }
    
    var color = UIColor.whiteColor() {
        didSet {
            let currentHighlighted = self.highlighted
            self.highlighted = currentHighlighted
        }
    }
    
    override var highlighted: Bool {
        didSet {
            if self.highlighted {
                backgroundView.backgroundColor = color.lighterColorForColor()
                layer.shadowColor = UIColor.blackColor().CGColor
                layer.shadowRadius = 2.0
                layer.shadowOffset = CGSize(width: 0, height: 1)
                layer.shadowOpacity = 0.75
            } else {
                backgroundView.backgroundColor = color
                layer.shadowColor = UIColor.blackColor().CGColor
                layer.shadowRadius = 2.0
                layer.shadowOffset = CGSize(width: 0, height: 1)
                layer.shadowOpacity = 0.4
            }
        }
    }
    
    // MARK: - Private
    
    private func initialize() {
        titleLabel.font = UIFont.ionicFontOfSize(24.0)
        titleLabel.textColor = iconColor
        titleLabel.textAlignment = NSTextAlignment.Center
        titleLabel.clipsToBounds = true
        
        backgroundView.backgroundColor = color
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

extension TBCircularIconButton {
    convenience init(icon: Ionic, frame: CGRect, target: AnyObject?, action: Selector, startColor start: UIColor? = nil, endColor end: UIColor? = nil) {
        self.init(frame: frame)
        self.icon = icon
        self.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    var icon: Ionic? {
        get {
            guard let text = titleLabel.text else {
                return nil
            }
            return Ionic(rawValue: text)
        } set {
            titleLabel.text = newValue?.rawValue
        }
    }
}
