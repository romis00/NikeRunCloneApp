//
//  FirstViewController.swift
//  NikeRunClone
//
//  Created by Roman Tuzhilkin on 8/14/20.
//  Copyright © 2020 Roman Tuzhilkin. All rights reserved.
//

import UIKit

class BeginRunVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startRubBtnPressed(_ sender: Any) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        guard let onRunVC = storyboard?.instantiateViewController(withIdentifier: CONSTANTS.instance.onRunVCIdentifier) else { return }
        onRunVC.modalPresentationStyle = .fullScreen
        present(onRunVC, animated: false, completion: nil)
    }
    
}

