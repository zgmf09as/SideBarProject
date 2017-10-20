//
//  DisplayViewController.swift
//  SideBarProject
//
//  Created by monk773 on 2017. 10. 20..
//  Copyright © 2017년 monk773. All rights reserved.
// 첫화면

import UIKit

class DisplayViewController: UIViewController {

    var delegate: RevealViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let btnSideBar = UIBarButtonItem(image: UIImage(named:"sidemenu.png"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(moveSide))
        
        navigationItem.leftBarButtonItem = btnSideBar
        // Do any additional setup after loading the view.
        
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide(_:)))
        dragLeft.edges = UIRectEdge.left
        view.addGestureRecognizer(dragLeft)
        
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide))
        dragRight.direction = .left
        view.addGestureRecognizer(dragRight)
    }

    @objc func moveSide(_ sender: Any) {
        
        if sender is UIScreenEdgePanGestureRecognizer {
            if delegate?.isSideBarShowing == false {
                delegate?.opensideBar(nil)
            }
        } else if sender is UISwipeGestureRecognizer {
            if delegate?.isSideBarShowing == true {
                delegate?.closesideBar(nil)
            }
        } else if sender is UIBarButtonItem {
            if delegate?.isSideBarShowing == false {
                delegate?.opensideBar(nil)
            } else {
                delegate?.closesideBar(nil)
            }
        }
    }
    
}
