//
//  HRControllerLoading.swift
//  HRLoading
//
//  Created by Obgniyum on 2018/1/23.
//

import Foundation
import Masonry

public extension UIViewController {
    
    /// UIViewController Loading
    ///
    /// - Parameters:
    ///   - size: Large or Default
    ///   - color: activity color
    ///   - maskColor: if maskColor is nil means no mask
    public func startLoading(size: HRLoadingSize, color: UIColor, maskColor: UIColor?) {
        // check exist status
        var exist:Bool = false
        for view in self.view.subviews {
            if view is HRLoadingMaskView {
                exist = true
            }
        }
        
        //
        if !exist {
            let activity = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
            activity.startAnimating()
            activity.color = color
            activity.isUserInteractionEnabled = false
            
            let maskView = HRLoadingMaskView()
            
            if let mask = maskColor {
                maskView.isUserInteractionEnabled = true
                maskView.backgroundColor = mask
            } else {
                maskView.isUserInteractionEnabled = false
                maskView.backgroundColor = .clear
            }
            
            maskView.addSubview(activity)
            activity.mas_makeConstraints({ (make) in
                make?.centerX.equalTo()(activity.superview)
                make?.centerY.equalTo()(activity.superview)
            })
            self.view!.addSubview(maskView)
            maskView.mas_makeConstraints({ (make) in
                make?.edges.equalTo()(maskView.superview)
            })
        }
    }
    
    public func stopLoading() {
        for view in self.view.subviews.reversed() {
            if view is HRLoadingMaskView {
                view.removeFromSuperview()
            }
        }
    }
}

