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
    
    func showSetting(){
        guard
          let settingViewController = UIStoryboard.storyboard(.setting).instantiateViewController(SettingViewController.self) else {
            return
        }

        settingViewController.router = self
        settingViewController.navigationController?.navigationBar.backItem?.hidesBackButton = false
        settingViewController.hidesBottomBarWhenPushed = false
        navigationController?.pushViewController(settingViewController, animated: false)
    
    }
}
