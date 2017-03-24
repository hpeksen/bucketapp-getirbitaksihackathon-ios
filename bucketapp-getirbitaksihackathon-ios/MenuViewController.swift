//
//  MenuViewController.swift
//  bucketapp-getirbitaksihackathon-ios
//
//  Created by Apple on 25.03.2017.
//  Copyright © 2017 OnurCal. All rights reserved.
//

import UIKit
import SideMenu

class MenuViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    
    //Initialize menu name's array
    var menuNameArr: Array = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
 menuNameArr = ["Anasayfa","Ayarlar"]
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuNameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
        
     cell.menuLabel.text = menuNameArr[indexPath.row]
        return cell
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
