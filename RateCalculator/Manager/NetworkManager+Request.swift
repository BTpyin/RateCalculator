//
//  NetworkManager+Request.swift
//  RateCalculator
//
//  Created by Bowie Tso on 26/1/2022.
//

import Foundation
import RxSwift
import RxCocoa

extension NetworkManager{
    static func toPath(domain: String, _ path: String) ->  URL{
        return URL(string: domain + path)!
    }
    
}

extension NetworkManager :HSBCExchangeRateProtocol{
    func getHSBCExhangeRate() -> Observable<HSBCRate>{
        return NetworkManager().request(NetworkManager.toPath(domain: NetworkManager.hsbcRateRequestBasePath, NetworkManager.currentRate), type: HSBCRate.self, method: .get)
    }
}


protocol HSBCExchangeRateProtocol{
    func getHSBCExhangeRate() -> Observable<HSBCRate>
}
