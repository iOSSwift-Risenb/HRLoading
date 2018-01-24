//
//  GCD.swift
//  HRLoading_Example
//
//  Created by Obgniyum on 2018/1/22.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation


open class HRGCD {
    public class func main(_ then:@escaping ()->() ) {
        DispatchQueue.main.async(execute: then)
    }
    
    public class func global(_ then:@escaping ()->() ) {
        DispatchQueue.global().async(execute: then)
    }
    
    public class func mainAfter(_ time:Float, _ then: @escaping ()->() ) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(Int(time * 1000)), execute: then)
    }
    
    public class func globalAfter(_ time:Float, _ then: @escaping () -> () ) {
        DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(Int(time * 1000)), execute: then)
    }
}

