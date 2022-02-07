//
//  RootRateNavigationController.swift
//  RateCalculator
//
//  Created by Bowie Tso on 24/1/2022.
//

import UIKit

class RootRateNavigationController: BaseNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        router = RootRouter(self)
        router?.showRate()
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
