//
//  RootRouter.swift
//  RateCalculator
//
//  Created by Bowie Tso on 24/1/2022.
//

import UIKit

class RootRouter: Router{
    
    func showTabController(){
        guard
          let tabBarVC = UIStoryboard.storyboard(.main).instantiateViewController(TabBarController.self) else {
            return
          }
        tabBarVC.navigationController?.navigationBar.backItem?.hidesBackButton = false
        tabBarVC.hidesBottomBarWhenPushed = false
        navigationController?.pushViewController(tabBarVC, animated: false)

    }
    
    func showRate(){
        guard
          let rateViewController = UIStoryboard.storyboard(.rate).instantiateViewController(RateViewController.self) else {
            return
        }

        rateViewController.router = self
        rateViewController.navigationController?.navigationBar.backItem?.hidesBackButton = false
        rateViewController.hidesBottomBarWhenPushed = false
        navigationController?.pushViewController(rateViewController, animated: false)
    
    }
}
