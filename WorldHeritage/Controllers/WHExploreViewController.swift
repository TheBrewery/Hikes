import UIKit
import RealmSwift
import AlamofireImage

class WHExploreViewController: WHSitesViewController {
    var animatingSearchBar: TBAnimatingSearchBar!

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

    func filter() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(filterButton)

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
                UIView.animateWithDuration(0.35) {
                    _self.searchViewController.view.frame.origin.y = 64
                }
            } else if _self.searchViewController.view.alpha == 1.0 {
                UIView.animateWithDuration(0.35, animations: {
                    _self.searchViewController.view.frame.origin.y = _self.parentViewController!.view.frame.maxY
                    }, completion: { (finished) in
                        _self.searchViewController.view.alpha = 0
                })
            }
        }

        view.addSubview(animatingSearchBar)
    }

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(scrollView: UIScrollView) {
        animatingSearchBar.contentOffsetDidChange(scrollView.contentOffset)
    }
}
