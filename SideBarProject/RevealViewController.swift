//
//  RevealViewController.swift
//  SideBarProject
//
//  Created by monk773 on 2017. 10. 20..
//  Copyright © 2017년 monk773. All rights reserved.
// 스토리 보드의 가장 앞에 위치하여 Displayview, rearview 컨트롤

import UIKit

class RevealViewController: UIViewController {

    var contentVC: UIViewController?
    var sideVC: UIViewController?
    var isSideBarShowing = false
    let SLIDE_TIME = 0.3
    let SIDEBAR_WIDTH: CGFloat = 260
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    // init display
    func setupView() {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            contentVC = vc
            addChildViewController(vc)//_프론트 컨트롤러를 메인 컨트롤러의 자식 뷰 컨트롤러로 등록
            
            view.addSubview(vc.view)//_프론트 컨트롤러의 서브뷰 등록
            vc.didMove(toParentViewController: self) // _프론트 컨트롤러에 부모 뷰 컨트롤러 변경 알림
            
            let frontVC = vc.viewControllers[0] as? DisplayViewController
            frontVC?.delegate = self
        }
    }
    
    //sidebar view load
    func getSideView() {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "sw_rear") {
            sideVC = vc
            addChildViewController(vc)
            view.addSubview(vc.view)
            
            vc.didMove(toParentViewController: self)
            view.bringSubview(toFront: (self.contentVC?.view)!) // _프론트 컨트롤러의 뷰를 제일 위로 올림
        }
    }
    
    func setShadowEffect(shadow: Bool, offset: CGFloat) {
        if shadow == true {
            
            guard let layer = contentVC?.view.layer else {
                return
            }
            
            layer.cornerRadius = 10
            layer.shadowOpacity = 0.8
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: offset, height: offset)
            
        }
        else {
            guard let layer = contentVC?.view.layer else {
                return
            }
            layer.cornerRadius = 8.0
            layer.shadowOffset = CGSize.zero
        }
    }
    
    func opensideBar(_ complete: ( () -> Void)?) {
        getSideView()
        setShadowEffect(shadow: true, offset: -2)
        
        let options = UIViewAnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(SLIDE_TIME), delay: TimeInterval(0), options: options, animations: {
            
            let vc = self.sideVC as! SideBarViewController
            self.contentVC?.view.frame = CGRect(x: vc.tableView.frame.width, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: { (bool: Bool) -> Void in
            if bool == true {
                self.isSideBarShowing = true
                complete?()
            }
        })
        
    }
    
    func closesideBar(_ complete: ( () -> Void)?) {
        let options = UIViewAnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        
        UIView.animate(withDuration: TimeInterval(SLIDE_TIME), delay: TimeInterval(0), options: options,
                       animations: {
                        self.contentVC?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                        
        }, completion: {
            if $0 == true {
                self.sideVC?.view.removeFromSuperview()
                self.sideVC = nil
                self.isSideBarShowing = false
                self.setShadowEffect(shadow: false, offset: 0)
                complete?()
            }
        })
    }

}
