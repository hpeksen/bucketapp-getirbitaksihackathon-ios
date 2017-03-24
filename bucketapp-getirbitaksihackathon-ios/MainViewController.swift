//
//  ViewController.swift
//  bucketapp-getirbitaksihackathon-ios
//
//  Created by Apple on 24.03.2017.
//  Copyright © 2017 OnurCal. All rights reserved.
//

import UIKit
import SideMenu

class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Side menu features
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        menuLeftNavigationController.leftSide = true
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        //Side menu gestures
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        SideMenuManager.menuPresentMode = .menuSlideIn
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func menuButtonClick(_ sender: Any) {
         present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

