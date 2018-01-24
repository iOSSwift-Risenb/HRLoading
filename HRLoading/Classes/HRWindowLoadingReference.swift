//
//  HRLoadingReference.swift
//  HRLoading
//
//  Created by Obgniyum on 2018/1/23.
//

public extension HRLoading {
    public class func startHRLoading() {
        startLoading(size: .Large, color: .darkGray, maskColor: nil)
    }
    
    public class func startHRMaskLoading() {
        startLoading(size: .Large, color: .darkGray, maskColor: UIColor.gray.withAlphaComponent(0.2))
    }
}


