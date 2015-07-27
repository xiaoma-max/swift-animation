//
//  ViewController.swift
//  SwiftAnimation
//
//  Created by Max on 27/07/2015.
//  Copyright (c) 2015 Max. All rights reserved.
//

import UIKit

// A delay function
func delay(#seconds: Double, completion:()->()) {
  let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
  
  dispatch_after(popTime, dispatch_get_main_queue()) {
    completion()
  }
}

class ViewController: UIViewController {
  
  // MARK: IB outlets
  @IBOutlet weak var passwordLeftConstraint: NSLayoutConstraint!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var heading: UILabel!
  @IBOutlet weak var username: UITextField!
  @IBOutlet weak var password: UITextField!
  @IBOutlet weak var cloud1: UIImageView!
  @IBOutlet weak var cloud2: UIImageView!
  @IBOutlet weak var cloud3: UIImageView!
  @IBOutlet weak var cloud4: UIImageView!
  var animationContainerView: UIView?
  // MARK: further UI
  let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
  let status = UIImageView(image: UIImage(named: "banner"))
  let label = UILabel()
  let messages = ["Connecting ...", "Authorizing ...", "Sending credentials ...", "Failed"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //set up the UI
    loginButton.layer.cornerRadius = 8.0
    loginButton.layer.masksToBounds = true
    
    spinner.frame = CGRect(x: -20.0, y: 6.0, width: 20.0, height: 20.0)
    spinner.startAnimating()
    spinner.alpha = 0.0
    loginButton.addSubview(spinner)
    
    status.hidden = true
    status.center = loginButton.center
    view.addSubview(status)
    
    label.frame = CGRect(x: 0.0, y: 0.0, width: status.frame.size.width, height: status.frame.size.height)
    label.font = UIFont(name: "HelveticaNeue", size: 18.0)
    label.textColor = UIColor(red: 0.89, green: 0.38, blue: 0.0, alpha: 1.0)
    label.textAlignment = .Center
    status.addSubview(label)
    passwordLeftConstraint.constant -= 100
    heading.center.x = -100 - view.bounds.width
    username.center.x = -100 - view.bounds.width
    password.center.x -= view.bounds.width
    println("1")
    //set up the animation container
    animationContainerView = UIView(frame: view.bounds)
    animationContainerView!.frame = view.bounds
    view.addSubview(animationContainerView!)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    println("2")
    loginButton.center.y += 30.0
    loginButton.alpha = 0.0
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    println("3")
    UIView.animateWithDuration(0.5, animations: {
      self.heading.center.x += self.view.bounds.width
    })
    
    UIView.animateWithDuration(0.5, delay: 0.3, options: .Repeat | .Autoreverse | .CurveEaseOut, animations: {
      self.username.center.x += self.view.bounds.width
      }, completion: nil)
    
    UIView.animateWithDuration(0.5, delay: 0.4, options: nil, animations: {
      self.password.center.x += self.view.bounds.width
      self.password.layoutIfNeeded()
      }, completion: nil)
    UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: nil, animations: {
      self.loginButton.center.y -= 30.0
      self.loginButton.alpha = 1.0 }, completion: nil)
    //create new view
    let newView = UIImageView(image: UIImage(named: "banner")!)
    newView.center = animationContainerView!.center
    //add the new view via transition
    UIView.transitionWithView(animationContainerView!, duration: 0.33,
        options: .CurveEaseOut | .TransitionFlipFromBottom, animations: {
        self.animationContainerView!.addSubview(newView) }, completion: nil)
  }
  
  // MARK: further methods
  @IBAction func login(sender: AnyObject) {
      UIView.animateWithDuration(1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: nil, animations: {
      self.loginButton.bounds.size.width += 80.0 }, completion: nil)
      
      UIView.animateWithDuration(0.33, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: {
          self.spinner.alpha = 1.0
          self.spinner.center = CGPoint(x: 40.0,
    y: self.loginButton.frame.size.height/2)
          self.loginButton.backgroundColor =
    UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
          self.loginButton.center.y += 60.0 }, completion: nil)
  }
  
  
}

