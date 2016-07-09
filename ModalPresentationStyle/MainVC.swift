//
//  MainVC.swift
//  ModalPresentationStyle
//
//  Created by Melissa Yung on 09/07/16.
//  Copyright © 2016 MY. All rights reserved.
//

import UIKit

class MainVC: UIViewController, ChildVCDelegate {
    
    var childVC:ChildVC!
    var loadingScreenVC:LoadingScreenVC!
    
    @IBOutlet weak var buttonModalPresentOverFullScreen: UIButton!
    @IBOutlet weak var buttonModalPresentOverContext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialise the child VC and the loading screen VC
        childVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ChildVC") as! ChildVC
        childVC.view.frame = CGRectMake(0, 0, 300, 300)
        childVC.view.center = self.view.center
        childVC.delegate = self
        
        loadingScreenVC = UINib(nibName: "LoadingScreenVC", bundle: nil).instantiateWithOwner(self, options: nil).first as! LoadingScreenVC
    }
    
    @IBAction func addChildVCPresentationContextTrueButtonPressed(sender: UIButton) {
        addChildVCWithPresentationContextValue(true)
    }
    
    @IBAction func addChildVCPresentationContextFalseButtonPressed(sender: UIButton) {
        addChildVCWithPresentationContextValue(false)
    }
    
    func addChildVCWithPresentationContextValue(value: Bool) {
        addChildViewController(childVC)
        self.view.addSubview(childVC.view)
        childVC.didMoveToParentViewController(self)
        childVC.definesPresentationContext = value
        
        // we can now add the modal from the child vc
        buttonModalPresentOverFullScreen.hidden = false
        buttonModalPresentOverContext.hidden = false
    }
    
    @IBAction func modalPresentVCOverFullScreen(sender: UIButton) {
        presentModalVCWithPresentationStyle(UIModalPresentationStyle.OverFullScreen)
    }
    
    @IBAction func modalPresentVCOverCurrentContext(sender: UIButton) {
        presentModalVCWithPresentationStyle(UIModalPresentationStyle.OverCurrentContext)
    }
    
    func presentModalVCWithPresentationStyle(style:UIModalPresentationStyle) {
        loadingScreenVC.modalPresentationStyle = style
        childVC.presentViewController(loadingScreenVC, animated: true, completion: nil)
    }
    
    // MARK: ChildVCDelegate methods
    func removeMe() {
        childVC.willMoveToParentViewController(nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParentViewController()
        
        // it only makes sense to demo this when we have a child vc
        buttonModalPresentOverContext.hidden = true
        buttonModalPresentOverFullScreen.hidden = true
    }
}

