//
//  CustomPresentAnimationController.swift
//  CustomTransitions
//
//  Created by Joyce Echessa on 3/3/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit

class CustomPresentAnimationController: NSObject,UIViewControllerAnimatedTransitioning {
    
    internal func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 5.5
    }
    
    internal func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let finalModFrame = CGRectMake(finalFrameForVC.origin.x, finalFrameForVC.origin.y + 90, finalFrameForVC.width, finalFrameForVC.height - 90)
        let containerView = transitionContext.containerView()
        let bounds = UIScreen.mainScreen().bounds
//        toViewController.view.frame = CGRectOffset(finalFrameForVC, 0, bounds.size.height)
        toViewController.view.frame = CGRectOffset(finalModFrame, 0, bounds.size.height)
        fromViewController.view.alpha = 0.5
        containerView.addSubview(toViewController.view)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .CurveLinear, animations: {
            fromViewController.view.alpha = 0.5
            
            toViewController.view.frame = finalModFrame
            
            }, completion: {
                finished in
                transitionContext.completeTransition(true)
                fromViewController.view.alpha = 0.5
        })
    }
    
}
