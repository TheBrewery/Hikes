import Foundation
import UIKit

// Use this file to define typealised closures to use in the project

typealias TBVoidClosure = () -> ()
typealias TBVoidWithBoolClosure = (Bool) -> ()
typealias TBVoidWithAnyObjectClosure = (AnyObject) -> ()
typealias TBVoidWithCountOrErrorClosure = (Int, NSError?) -> ()
typealias TBVoidWithFramesClosure = (beginFrame: CGRect, endFrame: CGRect) -> ()

func dispatchAfter(delay: NSTimeInterval, queue: dispatch_queue_t! = dispatch_get_main_queue(), closure: TBVoidClosure) {
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC)))
    dispatch_after(time, queue, closure)
}

var TBUnknownError: NSError {
    return NSError(domain: "io.thebrewery", code: 915, userInfo: nil)
}

enum DispatchQueueType {
    case Main
    case Background
    case Default
    case High
    case Low
}

func DispatchQueue(type: DispatchQueueType) -> dispatch_queue_t {
    switch type {
    case .Main: return dispatch_get_main_queue()
    case .Background: return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
    case .Default: return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    case .High: return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
    case .Low: return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
    }
}


func executeOn(type: DispatchQueueType, block: TBVoidClosure) {
    guard type == .Main && NSThread.isMainThread() else {
        return dispatch_async(DispatchQueue(type), block)
    }
    block()
}

