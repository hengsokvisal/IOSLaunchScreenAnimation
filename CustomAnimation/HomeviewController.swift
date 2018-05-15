//
//  ViewController.swift
//  CustomAnimation
//
//  Created by HengVisal on 5/15/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import UIKit

class HomeviewController: UIViewController {
    
    //UI Components
    var mainView : UIView!
    var facebook : UIImageView!
    var overlay : UIView!
    var logo : UIImageView!
    
    //Animation
    var animation : UIViewPropertyAnimator!
    let spring = UISpringTimingParameters(dampingRatio: 1, initialVelocity: CGVector(dx: 1, dy: 1))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createComponent()
        addSupview()
        decrease()
        perform(#selector(increase), with: self, afterDelay: 2)
        
    }
}

// MARK: - Create UI Components
extension HomeviewController {
    func createComponent() -> Void {
        
        //MainView
        mainView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        //Facebook Screen
        facebook = UIImageView(frame:CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        facebook?.image = #imageLiteral(resourceName: "facebookImage")
        
        //White Background UIView Using To Make Transparent Effect
        overlay = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        overlay.backgroundColor = UIColor.white
        
        //UIView For Quad Logo
        logo = UIImageView(frame: CGRect(x: 0 , y: 0, width: 200, height: 200))
        logo.image = #imageLiteral(resourceName: "quad_logo_process")
        logo.center = mainView.center
    }
}

// MARK: - Add Supview
extension HomeviewController {
    func addSupview() -> Void {
        
        view.addSubview(mainView)
        view.addSubview(facebook)
        view.addSubview(overlay)
        view.addSubview(logo)
    }
}


// MARK: - Animation
extension HomeviewController {

    func decrease() -> Void {
        animation = UIViewPropertyAnimator(duration: 3, timingParameters: self.spring)
        animation.addAnimations { [weak self] in
            guard let selfC = self else {return}
            selfC.logo.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
            selfC.logo.center = selfC.mainView.center
        }
        animation.startAnimation()
    }
    
    @objc func increase() -> Void {
        animation = UIViewPropertyAnimator(duration: 2, timingParameters: self.spring)
        animation.addAnimations { [weak self] in
            guard let selfC = self else {return}
            selfC.logo.transform = CGAffineTransform(scaleX: 30, y: 30)
            selfC.logo.alpha = 0
            selfC.overlay.alpha = 0
        }
        animation.startAnimation()
    }
}









