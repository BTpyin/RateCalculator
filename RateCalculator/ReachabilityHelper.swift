//
//  ReachabilityHelper.swift
//  RateCalculator
//
//  Created by Bowie Tso on 26/1/2022.
//

import Foundation
import Alamofire

class ReachabilityHelper{
    static let shared = ReachabilityHelper()
    let manager = NetworkReachabilityManager(host: "www.google.com")
    
    init(){
        if manager?.isReachableOnEthernetOrWiFi ?? false || manager?.isReachableOnCellular ?? false {
            print("Network Available")
        }else{
            print("Network Unavailable")
        }
        
        manager?.startListening(onUpdatePerforming: { status in
            
            switch status {
                
            case .notReachable:
                print("network connection status - lost")
            case .reachable(.ethernetOrWiFi):
                print("network connection status - ethernet/WiFI")
            case .reachable(.cellular):
                print("network connection status - cellular")
            default:
                break
            }
        })

    }
    
}
