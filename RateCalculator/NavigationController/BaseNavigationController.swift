//
//  BaseNavigationController.swift
//  RateCalculator
//
//  Created by Bowie Tso on 24/1/2022.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    var router: RootRouter? {
      didSet {
        // Pass the router into TopViewController
        if let topVC = topViewController as? BaseViewController {
          topVC.router = router
        }
          
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
