//
//  ViewController.swift
//  RateCalculator
//
//  Created by Bowie Tso on 24/1/2022.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    var router: Router?
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }
    
    func startLoading() {
      loadingIndicator?.startAnimating()
      loadingIndicator?.isHidden = false
    }

    func stopLoading() {
        loadingIndicator?.stopAnimating()
        loadingIndicator?.isHidden = true
    }

    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    func showAlert(_ title: String?, okClicked: ((UIAlertAction) -> Void)? = nil) {
      let alertVC = UIAlertController.init(title: title, message: nil, preferredStyle: .alert)
      alertVC.addAction(UIAlertAction.init(title: "OK", style: .default, handler: okClicked))
      present(alertVC, animated: true, completion: nil)
    }
    
    func showAlert(error : FailReason, okClicked: ((UIAlertAction) -> Void)? = nil){
        let alertVC = UIAlertController.init(title: "Error", message: nil, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction.init(title: "OK", style: .default, handler: okClicked))
        switch error{
            case .nullData:
                alertVC.message = "Null data is found."
            case .network:
                alertVC.message = "Network error."
            case .realmWrite:
                alertVC.message = "Error on writing on local storage"
            case .cert:
                alertVC.message = "Cert error"
            case .other:
                alertVC.message = "Error"
        }
            
    }

}

