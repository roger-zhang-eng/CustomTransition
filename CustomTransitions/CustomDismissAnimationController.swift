//
//  CustomDismissAnimationController.swift
//  CustomTransitions
//
//  Created by Joyce Echessa on 3/3/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

import UIKit
import Foundation

protocol ItemTableViewProtocol: class {
    func tableViewPopup()
}

class CustomDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    weak var itemTableViewDelegate: ItemTableViewProtocol?
    
    internal func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 3
    }
    
    internal func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        //let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        //let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        //let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        //let finalFrameForVC = transitionContext.finalFrameForViewController(toViewController)
        let containerView = transitionContext.containerView()
        //toView.frame = finalFrameForVC
        //toView.alpha = 0.5
        //containerView.addSubview(toViewController.view)
        
        //let snapshotView = fromViewController.view.snapshotViewAfterScreenUpdates(false)
        //snapshotView!.frame = fromViewController.view.frame
        //containerView.addSubview(snapshotView!)
        
        let bounds = UIScreen.mainScreen().bounds
        let fromViewHeight = fromView.frame.height
        let currentFrameForVC = fromView.frame
        let finalModFrame = CGRectMake(currentFrameForVC.origin.x, currentFrameForVC.origin.y + fromViewHeight, currentFrameForVC.width, fromViewHeight)
        
        //containerView.addSubview(toViewController.view)
        
        
        UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
            //snapshotView!.frame = CGRectInset(fromViewController.view.frame, fromViewController.view.frame.size.width / 2, fromViewController.view.frame.size.height / 2)
            //toView.alpha = 1.0
            fromView.frame = finalModFrame
        }, completion: {
            finished in
            //snapshotView!.removeFromSuperview()
            transitionContext.completeTransition(true)
            fromView.removeFromSuperview()
            
            self.itemTableViewDelegate?.tableViewPopup()
            //toView.alpha = 1.0
            
            //transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
        
    }
   
}
