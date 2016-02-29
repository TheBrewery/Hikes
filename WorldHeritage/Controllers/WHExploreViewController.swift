import UIKit
import RealmSwift
import AlamofireImage

class WHSiteCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    private let gradientLayer = CAGradientLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()

        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        gradientLayer.colors = [UIColor(white: 0, alpha: 0).CGColor, UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.6).CGColor]
        
        contentView.layer.insertSublayer(gradientLayer, below: titleLabel.layer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height/2.0)
    }
}

class WHExploreViewController: TBBaseViewController {
    let WHSiteCollectionViewCellIdentifier = "WHSiteCollectionViewCellIdentifier"

    var animatingSearchBar: TBAnimatingSearchBar!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewTopConstraint: NSLayoutConstraint!
    
    let dataSource = SitesRealmDataSource()
    
    lazy var filterButton: TBCircularIconButton = {
        let buttonSize = CGSize(width: 50, height: 50)
        let buttonFrame = CGRect(origin: CGPointZero, size: buttonSize)
        
        let button = TBCircularIconButton(icon: Ionic.AndroidFunnel, frame: buttonFrame, target: self, action: "filter")
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.height)
        let widthConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: buttonSize.width)
        button.addConstraints([heightConstraint, widthConstraint])
        
        self.view.addSubview(button)
        let horizontalConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: -20)
        let bottomConstraint = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -69)
        self.view.addConstraints([horizontalConstraint, bottomConstraint])
        return button
    }()
    
    lazy var searchViewController: WHSearchViewController = {
        let searchViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WHSearchViewController")
        let searchView = searchViewController.view
        searchViewController.willMoveToParentViewController(self)
        
        let parent = self.parentViewController!
        
        parent.view.addSubview(searchView)
        searchView.frame = CGRectInset(UIScreen.mainScreen().bounds, 0, 32)
        searchView.frame.origin.y = parent.view.frame.maxY
        searchView.alpha = 0
        parent.addChildViewController(searchViewController)
        searchViewController.didMoveToParentViewController(parent)
        return searchViewController as! WHSearchViewController
    }()
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func filter() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self.collectionView, selector: "reloadData", name: RealmDataBaseDidLoadNotification, object: nil)
        
        view.addSubview(filterButton)
        
        preferredBlurredStatusBarStyleBarStyle = .LightDefault
        
        animatingSearchBar = TBAnimatingSearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        
        animatingSearchBar.textDidChange = { [weak self](text) in
            guard let _self = self else {
                return
            }
            _self.searchViewController.searchText = text
        }
        
        animatingSearchBar.stateChangeDidComplete = { [weak self](state) in
            guard let _self = self else {
                return
            }
            
            if state == TBAnimatingSearchBarState.Expanded {
                _self.searchViewController.view.alpha = 1
                UIView.animateWithDuration(0.35, animations: { () -> Void in
                    _self.searchViewController.view.frame.origin.y = 64
                })
            } else if _self.searchViewController.view.alpha == 1.0 {
                UIView.animateWithDuration(0.35, animations: { () -> Void in
                    _self.searchViewController.view.frame.origin.y = _self.parentViewController!.view.frame.maxY
                    }, completion: { (finished) in
                        _self.searchViewController.view.alpha = 0
                })
            }
        }
        
        view.addSubview(animatingSearchBar)
        
        navigationController?.navigationBarHidden = true
    }

    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        animatingSearchBar.contentOffsetDidChange(scrollView.contentOffset)
        
        for cell in self.collectionView.visibleCells() as! [WHSiteCollectionViewCell] {
    
            let bounds = self.collectionView.bounds
            let boundsCenter = CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds))
            let cellCenter = cell.center
            let offsetFromCenter = CGPointMake(boundsCenter.x - cellCenter.x, boundsCenter.y - cellCenter.y)
            
            let cellSize = cell.bounds.size
            let maxVerticalOffset = (bounds.size.height / 2) + (cellSize.height / 2)
            let scaleFactor = 25.0 / maxVerticalOffset
            
            cell.imageView.frame.origin.y = -offsetFromCenter.y * scaleFactor - 25.0
        }
    }
}

extension WHExploreViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let viewController = WHSiteViewController.createWith(dataSource[indexPath]!)
        self.showViewController(viewController, sender: nil)
    }
}

extension WHExploreViewController: UICollectionViewDataSource {
    // Mark - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.width, 200)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(WHSiteCollectionViewCellIdentifier, forIndexPath: indexPath) as! WHSiteCollectionViewCell
        
        guard let site = dataSource[indexPath] else {
            return cell
        }

//        TODO
        let attributedString = NSMutableAttributedString(string: site.name, attributes: [NSFontAttributeName: UIFont.regularFontOfSize(24)])
        attributedString.appendAttributedString(NSAttributedString(string: " " + site.countries, attributes: [NSFontAttributeName: UIFont.lightFontOfSize(24)]))
        cell.titleLabel.attributedText = attributedString
        cell.titleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.titleLabel.layer.shadowOpacity = 0.32
        
//        cell.subtitleLabel.text = site.location
//        cell.subtitleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
//        cell.subtitleLabel.layer.shadowOpacity = 0.32
        
        cell.rightLabel.attributedText = Ionic.Heart.attributedStringWithFontSize(28)
        cell.rightLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        cell.rightLabel.layer.shadowOpacity = 0.32

        if let url = site.imageUrl {
            cell.imageView?.af_setImageWithURL(url, placeholderImage: UIImage(named:"petra")!)
        }
        
        return cell
    }
}

