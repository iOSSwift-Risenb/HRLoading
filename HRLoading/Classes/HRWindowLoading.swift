//
//  HRLoading.swift
//  HRLoading
//
//  Created by Obgniyum on 2018/1/22.
//

import UIKit
import Masonry

public enum HRLoadingSize {
    case Large
    case Default
}

open class HRLoading {

    /// HRLoading In Window
    ///
    /// - Parameters:
    ///   - size: Large or Default
    ///   - color: activity color
    ///   - maskColor: if maskColor is nil means no mask
    open class func startLoading(size: HRLoadingSize, color: UIColor, maskColor: UIColor?) {
        // check exist status
        var exist:Bool = false
        let w = UIApplication.shared.keyWindow
        if let window = w {
            for view in window.subviews {
                if view is HRLoadingMaskView {
                    exist = true
                }
            }
            
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
                window.addSubview(maskView)
                maskView.mas_makeConstraints({ (make) in
                    make?.edges.equalTo()(maskView.superview)
                })
            }
        }
    }
    
    open class func stopLoading() {
        let window = UIApplication.shared.keyWindow
        for view in window!.subviews {
            if view is HRLoadingMaskView {
                view.removeFromSuperview()
            }
        }
    }
}

/// identifier view, just in mode
internal final class HRLoadingMaskView: UIView {}


