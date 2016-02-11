import UIKit
import RealmSwift
import AlamofireImage

class HikeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var rightLabel: UILabel?
}

class HikesViewController: UIViewController {
    let HikeCollectionViewCellIdentifier = "HikeCollectionViewCell"

    var animatingSearchBar: TBAnimatingSearchBar!
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var collectionViewTopConstraint: NSLayoutConstraint!
    
    let dataSource = HikesDataSource()
    
    lazy var searchViewController: SearchViewController = {
        let searchViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("SearchViewController")
        let searchView = searchViewController.view
        searchViewController.willMoveToParentViewController(self)
        self.view.addSubview(searchView)
        searchView.frame = CGRectInset(UIScreen.mainScreen().bounds, 0, 32)
        searchView.frame.origin.y = self.view.frame.maxY
        searchView.alpha = 0
        self.addChildViewController(searchViewController)
        searchViewController.didMoveToParentViewController(searchViewController)
        return searchViewController as! SearchViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animatingSearchBar = TBAnimatingSearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 80))
        
        animatingSearchBar.textDidChange = { (text) in
            self.searchViewController.searchText = text
        }
        
        animatingSearchBar.stateChangeDidComplete = { (state) in
            if state == TBAnimatingSearchBarState.Expanded {
                self.searchViewController.view.alpha = 1
                UIView.animateWithDuration(0.35, animations: { () -> Void in
                    self.searchViewController.view.frame.origin.y = 64
                })
            } else if self.searchViewController.view.alpha == 1.0 {
                UIView.animateWithDuration(0.35, animations: { () -> Void in
                    self.searchViewController.view.frame.origin.y = self.view.frame.maxY
                    }, completion: { (finished) in
                        self.searchViewController.view.alpha = 0
                })
            }
        }
        
        view.addSubview(animatingSearchBar)
        
        navigationController?.navigationBarHidden = true
    }

    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        animatingSearchBar.contentOffsetDidChange(scrollView.contentOffset)
    }
}

extension HikesViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let viewController = HikeViewController.createWith(dataSource[indexPath]!)
        self.showViewController(viewController, sender: nil)
    }
}

extension HikesViewController: UICollectionViewDataSource {
    // Mark - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.bounds.width, 220)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HikeCollectionViewCellIdentifier, forIndexPath: indexPath) as! HikeCollectionViewCell
        
        guard let hike = dataSource[indexPath] else {
            return cell
        }
        
        cell.titleLabel!.text = hike.name
        cell.subtitleLabel!.text = hike.locality
        cell.rightLabel!.text = String(format: "%.1f mi", hike.distance/1.6)
        
        if let url = hike.images.first?.urlForImageSize(.Medium) {
            cell.imageView?.af_setImageWithURL(url, placeholderImage: UIImage(named:"the-narrows")!)
        }
                
        return cell
    }
}

