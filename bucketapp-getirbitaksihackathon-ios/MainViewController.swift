//
//  ViewController.swift
//  bucketapp-getirbitaksihackathon-ios
//
//  Created by Apple on 24.03.2017.
//  Copyright © 2017 OnurCal. All rights reserved.
//

import UIKit
import SideMenu
import FBSDKLoginKit

class MainViewController: UIViewController,FBSDKLoginButtonDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Side menu features
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        menuLeftNavigationController.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        //Side menu gestures
      //  SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
       // SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        SideMenuManager.menuPresentMode = .menuSlideIn
        
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        view.addSubview(loginButton)
        loginButton.delegate = self

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
        print("something went wrong...\(error)")
            return
        }
        print("Successfully logged in Facebook")
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("Successfully logged out Facebook")
    }
    @IBAction func menuButtonClick(_ sender: Any) {
         present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
  


}

