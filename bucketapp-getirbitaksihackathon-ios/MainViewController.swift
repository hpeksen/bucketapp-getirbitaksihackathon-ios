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

    var dict : [String : AnyObject]!
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
        
        
        var loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        view.addSubview(loginButton)
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile","email","user_friends","user_events"]
 //loginButton = loginButton(ReadPermission[.publicProfile,.email,.userFriends])
        // Do any additional setup after loading the view, typically from a nib.
    }
    var facebookID : NSString?
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        var userId = 0
        if error != nil {
        print("something went wrong...\(error)")
            return
        }
        print("Successfully logged in Facebook")
        
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "/\(FBSDKAccessToken.current().userID!)/events", parameters: ["fields": "data, description"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    self.dict = result as! [String : AnyObject]
                    print(result!)
                    print(self.dict)
                }
            })
        }
    
    
//        FBSDKGraphRequest.init(graphPath: "/{\(FBSDKAccessToken.current().userID!)}/events", parameters: ["fields" : "data, description"], httpMethod: "GET").start(completionHandler: { (connection,  result, error) -> Void in
//            print(error)
//            if ((error) != nil)
//         
//            {
//                print("hakan")
//                print(result)
//           
//            }
//        })
        
//        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id"])
//        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
//            let data:[String:AnyObject] = result as! [String : AnyObject]
//            
//            self.facebookID  = data["id"]! as? NSString
//           
//            print("id")
//            print(self.facebookID!)
//            FBSDKGraphRequest.init(graphPath: "/{\(self.facebookID!)}/events", parameters: ["fields" : "data, description"], httpMethod: "GET").start(completionHandler: { (connection,  result, error) -> Void in
//                print(error)
//                if ((error) != nil)
//                    
//                {
//                    print("hakan")
//                    print(result)
//                    
//                }
//            })
//            
//        })
       
        
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
//        FBSDKGraphRequest.init(graphPath: "/\(facebookID!)/events", parameters: ["fields" : "data, description"], httpMethod: "GET").start(completionHandler: { (connection,  result, error) -> Void in
//            
//            if ((error) != nil)
//                
//            {
//                print("hakan")
//                print(result)
//                
//            }
//        })
        print("Successfully logged out Facebook")
    }
    @IBAction func menuButtonClick(_ sender: Any) {
         present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
  


}
