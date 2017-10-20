//
//  FrontViewController.swift
//  SideBarProject
//
//  Created by monk773 on 2017. 10. 20..
//  Copyright © 2017년 monk773. All rights reserved.
//

import UIKit

class FrontViewController: UIViewController {

    @IBOutlet var sideBarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let revealvc = self.revealViewController() {
            self.sideBarButton.target = revealvc
            sideBarButton.action = #selector(revealvc.revealToggle(_:))
            
            view.addGestureRecognizer(revealvc.panGestureRecognizer())
        }
    }
}
