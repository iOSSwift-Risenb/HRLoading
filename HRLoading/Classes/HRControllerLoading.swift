//
//  HRControllerLoading.swift
//  HRLoading
//
//  Created by Obgniyum on 2018/1/23.
//

import Masonry
import HRGCD

public extension UIViewController {
    
    /// UIViewController Loading
    ///
    /// - Parameters:
    ///   - size: Large or Default
    ///   - color: activity color
    ///   - maskColor: if maskColor is nil means no mask
    public func startLoading(size: HRLoadingSize, color: UIColor, maskColor: UIColor?) {
        
        HRGCD.main {
            self._start(size: size, color: color, maskColor: maskColor)
        }
    }
    
    public func stopLoading() {
        HRGCD.main {
            self._stop()
        }
    }
    
    
    
    private func _start(size: HRLoadingSize, color: UIColor, maskColor: UIColor?) {
        
        // check exist status
        var exist:Bool = false
        for v in view.subviews {
            if v is HRLoadingMaskView {
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
            view!.addSubview(maskView)
            maskView.mas_makeConstraints({ (make) in
                make?.edges.equalTo()(maskView.superview)
            })
        }
    }

    private func _stop() {
        for v in view.subviews.reversed() {
            if v is HRLoadingMaskView {
                v.removeFromSuperview()
            }
        }
    }
}

