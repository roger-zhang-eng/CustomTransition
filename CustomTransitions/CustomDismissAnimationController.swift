//
//  CustomDismissAnimationController.swift
//  CustomTransitions
//
//  Created by Joyce Echessa on 3/3/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Foundation

class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    internal func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 3
    }
    
    internal func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        //let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        //let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        //let containerView = transitionContext.containerView()
        
        //let snapshotView = fromViewController.view.snapshotViewAfterScreenUpdates(false)
        //snapshotView!.frame = fromViewController.view.frame
        //containerView.addSubview(snapshotView!)
        
        //let bounds = UIScreen.mainScreen().bounds
        let fromViewHeight = fromView.frame.height
        let currentFrameForVC = fromView.frame
        let finalModFrame = CGRectMake(currentFrameForVC.origin.x, currentFrameForVC.origin.y + fromViewHeight, currentFrameForVC.width, fromViewHeight)
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            //snapshotView!.frame = CGRectInset(fromViewController.view.frame, fromViewController.view.frame.size.width / 2, fromViewController.view.frame.size.height / 2)
            fromView.frame = finalModFrame
            
            toViewController.view.transform = CGAffineTransformIdentity
        }, completion: {
            finished in
            //snapshotView!.removeFromSuperview()
            transitionContext.completeTransition(true)
            fromView.removeFromSuperview()
            toViewController.view.alpha = 1.0
        })
        
    }
   
}
