import Foundation
import UIKit

// Use this file to define typealised closures to use in the project

typealias TLVoidClosure = () -> ()
typealias TLVoidWithBoolClosure = (Bool) -> ()
typealias TLVoidWithAnyObjectClosure = (AnyObject) -> ()
typealias TLVoidWithCountOrErrorClosure = (Int, NSError?) -> ()
typealias TLVoidWithFramesClosure = (beginFrame: CGRect, endFrame: CGRect) -> ()

func delayClosureExecution(delay: NSTimeInterval, queue: dispatch_queue_t! = dispatch_get_main_queue(), closure: TLVoidClosure) {
    let time = dispatch_time(  DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(time, queue, closure)
}

var TLUnknownError: NSError {
    return NSError(domain: "io.thebrewery", code: 915, userInfo: nil)
}

