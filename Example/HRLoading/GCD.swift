//
//  GCD.swift
//  HRLoading_Example
//
//  Created by Obgniyum on 2018/1/22.
//  Copyright © 2018年 CocoaPods. All rights reserved.
//

import Foundation

public func GCDMain_After(_ time:Float, _ then: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(Int(time * 1000)), execute: then)
}

public func GCDGlobal_After(_ time:Float, _ then: @escaping () -> Void) {
    DispatchQueue.global().asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(Int(time * 1000)), execute: then)
}


