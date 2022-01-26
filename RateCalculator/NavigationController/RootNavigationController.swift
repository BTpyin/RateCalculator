//
//  RootNavigationController.swift
//  RateCalculator
//
//  Created by Bowie Tso on 25/1/2022.
//

import UIKit

class RootNavigationController: BaseNavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router = RootRouter(self)
        router?.showTabController()
        // Do any additional setup after loading the view.
    }
    

}
