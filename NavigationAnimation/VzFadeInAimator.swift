//
//  TRCustomNavTransitionAnimator.swift
//  Traveler
//
//  Created by Ashutosh on 4/26/16.
//  Copyright © 2016 Forcecatalyst. All rights reserved.
//

import Foundation
import UIKit

class VzFadeInAimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    fileprivate let ANIMATION_DURATION = 0.35
    var transitionInProgress:Bool = false
    var tabBarController: UITabBarController!
    var lastIndex = 0
    

    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return ANIMATION_DURATION
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)!
        
        transitionContext.containerView.addSubview(toViewController.view)
        
        toViewController.view.alpha = 0.0
        UIView.animate(withDuration: ANIMATION_DURATION, animations: {
            toViewController.view.alpha = 1.0
            }, completion: { (finished) in
                
                fromViewController?.view.removeFromSuperview()
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
}

