
import CoreLocation
import UIKit

extension CLLocationCoordinate2D {
    func coordinatesSeparatedByComma() -> String {
        return "\(self.latitude),\(self.longitude)"
    }
}

enum TBLocationServicesStatus {
    case Authorized
    case Unauthorized
    case Disabled
}

class TBLocationManager: CLLocationManager, CLLocationManagerDelegate {
    private static let sharedInstance = TBLocationManager()

    private var didChangeAuthorizationStatus: ((CLAuthorizationStatus) -> ())?
    private var didUpdateLocations: ((CLLocation?, NSError?) -> ())?

    private override init() {
        super.init()
        desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        distanceFilter = 500
        delegate = self
    }

    class func unauthorizedAlertController() -> UIViewController {
        let appName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
        let title = "Allow \"\(appName)\" to access your location while you use the app?"
        let message = NSBundle.mainBundle().infoDictionary!["NSLocationWhenInUseUsageDescription"] as! String

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Don't Allow", style: .Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Allow", style: .Default, handler: { (action) in ()
            let url = NSURL(string: UIApplicationOpenSettingsURLString)!
            UIApplication.sharedApplication().openURL(url)
        }))
        return alertController
    }

    class func disabledAlertController() -> UIViewController {
        let title = "Location Services is disabled"
        let message = NSBundle.mainBundle().infoDictionary!["NSLocationWhenInUseUsageDescription"] as! String

        let alertController = UIAlertController(title: title, message: message + " Please turn on Location Services in the Privacy section of your device settings.", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "No Thanks", style: .Default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Go to Settings", style: .Default, handler: { (action) in ()
            UIApplication.sharedApplication().openURL(NSURL(string: UIApplicationOpenSettingsURLString)!)
        }))
        return alertController
    }

    class var currentLocation: CLLocation? {
        return sharedInstance.location
    }

    class var isAvailable: Bool {
        return isEnabled && isAuthorized
    }

    class var isAuthorized: Bool {
        return authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse
    }

    class var isEnabled: Bool {
        return locationServicesEnabled()
    }

    class func authorize(completion: ((CLAuthorizationStatus) -> ())? = nil) {
        sharedInstance.didChangeAuthorizationStatus = completion
        sharedInstance.requestWhenInUseAuthorization()
    }

    class func updateLocation() {
        sharedInstance.startUpdatingLocation()
    }

    class func getGeolocation(completion: ((CLLocation?, NSError?) -> ())?) {
        guard let location = sharedInstance.location else {
            sharedInstance.didUpdateLocations = completion
            updateLocation()
            return
        }
        completion?(location, nil)
    }

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        stopUpdatingLocation()
        didUpdateLocations?(locations.first, nil)
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        stopUpdatingLocation()
        didUpdateLocations?(nil, error)
    }

    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        didChangeAuthorizationStatus?(status)
    }
}
