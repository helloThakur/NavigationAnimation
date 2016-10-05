//
//  ViewController.swift
//  NavigationAnimation
//
//  Created by Ashutosh on 9/30/16.
//  Copyright © 2016 Verizon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    var animator = VzFadeInAimator()
    var reverseAnimator = VzModalDropCloseAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func pushViewB () {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "viewB")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func pushViewC () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "viewB")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        if operation == .push {
            return self.animator
        } else if operation == .pop {
            return self.reverseAnimator
        }
        
        return nil
    }
}

