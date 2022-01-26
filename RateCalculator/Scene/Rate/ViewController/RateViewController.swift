//
//  RateViewController.swift
//  RateCalculator
//
//  Created by Bowie Tso on 25/1/2022.
//

import UIKit

class RateViewController: BaseViewController {


    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var inverseSwitch: UISwitch!
    @IBOutlet weak var headerSegment: UIView!
    @IBOutlet weak var headerAmountTextLabel: UILabel!
    @IBOutlet weak var headerInverseTextLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
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
