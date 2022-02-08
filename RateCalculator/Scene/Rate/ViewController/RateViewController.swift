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
    
    var viewModel:RateViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = RateViewModel()
        tableView.delegate = self
        tableView.dataSource = self
        setUpBinding()
        // Do any additional setup after loading the view.
    }
    
    func setUpBinding(){
        viewModel?.output.rateDiplayListBehaviorRelay.subscribe(onNext:{ [weak self]_ in
            self?.tableView.reloadData()
        }).disposed(by: disposeBag)
    }

}

extension RateViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.output.rateDiplayListBehaviorRelay.value?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RateTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RateTableViewCell else {
          fatalError("The dequeued cell is not an instance of RateTableViewCell.")
        }
        guard let rate = viewModel?.output.rateDiplayListBehaviorRelay.value?[indexPath.row] else { return cell }
        cell.uiBind(rate: rate)
//        cell.viewModel.input.albumRelay.accept(album)
        return cell
    }
    
    
}
