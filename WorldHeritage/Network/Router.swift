//
//  Router.swift
//  
//
//  Created by James Hildensperger on 5/16/16.
//
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    static let baseURLString = "https://thebreweryio-world-heritage.herokuapp.com"
    
    case GetImages(String)
    
    var method: Alamofire.Method {
        switch self {
        case .GetImages:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .GetImages(let id):
            return "/images/" + id
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: Router.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        return mutableURLRequest
    }
}