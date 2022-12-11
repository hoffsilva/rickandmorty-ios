//
//  UIViewController+Utils.swift
//  RickAndMortyWithFlow
//
//  Created by Hoff Henry Pereira da Silva on 08/02/20.
//  Copyright © 2020 Hoff Henry Pereira da Silva. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    var activityIndicatorTag: Int { return 999_999 }
    func pleaseWaiting() {
        DispatchQueue.main.async {
            let overlayView = UIView(frame: UIScreen.main.bounds)
            overlayView.alpha = 0
            overlayView.tag = self.activityIndicatorTag
            overlayView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            var activityIndicator: UIActivityIndicatorView!
            if #available(iOS 13.0, *) {
                activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            } else {
                activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            }
            activityIndicator.color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            activityIndicator.alpha = 1.0
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            overlayView.addSubview(activityIndicator)
            self.view.addSubview(overlayView)
            self.view.bringSubviewToFront(overlayView)
            UIView.animate(withDuration: 0.9, delay: 0.0, options: .curveEaseIn, animations: {
                overlayView.alpha = 0.6
            }, completion: nil)
            activityIndicator.startAnimating()
        }
    }

    func removeActivityIndicator() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.subviews.filter(
                { $0.tag == self.activityIndicatorTag }
            ).first {
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseOut, animations: {
                    activityIndicator.alpha = 0
                }) { _ in
                    activityIndicator.removeFromSuperview()
                }
            }
        }
    }
}
