//
//  LoadingScreenVC.swift
//  ModalPresentationStyle
//
//  Created by Melissa Yung on 09/07/16.
//  Copyright © 2016 MY. All rights reserved.
//

import UIKit


class LoadingScreenVC: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // tap to dismiss view
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoadingScreenVC.handleTap))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
    }
    
    func handleTap() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
