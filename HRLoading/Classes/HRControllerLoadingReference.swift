//
//  HRControllerLoadingReference.swift
//  HRLoading
//
//  Created by Obgniyum on 2018/1/23.
//

public extension UIViewController {
    public func startHRLoading() {
        startLoading(size: .Large, color: .darkGray, maskColor: nil)
    }
    
    public func startHRMaskLoading() {
        startLoading(size: .Large, color: .darkGray, maskColor: UIColor.gray.withAlphaComponent(0.2))
    }
}



