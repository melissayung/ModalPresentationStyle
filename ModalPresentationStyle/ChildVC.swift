//
//  ChildVC.swift
//  ModalPresentationStyle
//
//  Created by Melissa Yung on 09/07/16.
//  Copyright © 2016 MY. All rights reserved.
//

import UIKit

protocol ChildVCDelegate {
    func removeMe()
}

class ChildVC: UIViewController {

    var delegate: ChildVCDelegate? = nil
    
    @IBAction func removeMeButtonPressed(sender: UIButton) {
        delegate!.removeMe()
    }
}
