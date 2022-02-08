//
//  HSBCRate.swift
//  RateCalculator
//
//  Created by Bowie Tso on 25/1/2022.
//

import Foundation
struct HSBCRate : Codable{
//    var lastUpdateTime: String?
    let detailRates:[FxttExchangeRates]?
}

struct FxttExchangeRates:Codable{
    let ccy: String?
//    var ccyDisplayCode: String?
    let ccyName: String?
//    var ccyBaseRemark: String?
//    var chartFlag: String?
    let ttBuyRt: String?
    let ttSellRt: String?
    let bankBuyRt: String?
    let bankSellRt: String?
    let ccyNameZh: String?
    let ccyNameCn: String?
    let ccyNameEn: String?
}
