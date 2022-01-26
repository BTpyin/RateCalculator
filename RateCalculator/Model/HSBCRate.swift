//
//  HSBCRate.swift
//  RateCalculator
//
//  Created by Bowie Tso on 25/1/2022.
//

import Foundation
struct HSBCRate : Codable{
    var lastUpdateTime: String?
    var fxttExchangeRates:[FxttExchangeRates]?
}

struct FxttExchangeRates:Codable{
    var ccyCode: String?
    var ccyDisplayCode: String?
    var ccyDisplayName: String?
    var ccyBaseRemark: String?
    var chartFlag: String?
    var ttBuyRate: String?
    var ttSellRate: String?
    var ccyNameZh: String?
    var ccyNameCn: String?
    var ccyNameEn: String?
}
