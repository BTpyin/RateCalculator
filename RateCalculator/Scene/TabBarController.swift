//
//  TabBarController.swift
//  RateCalculator
//
//  Created by Bowie Tso on 24/1/2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
//        if let tabBar = appDelegate.window?.rootViewController as UITabBarController{
//            tabBar.selectedIndex = 0
//        }

           
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
