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
    let bankBuyRt: String?
    let bankSellRt: String?
    let ccyNameZh: String?
    let ccyNameCn: String?
    let ccyNameEn: String?
    
    func getBuyAt() -> String?{
        let inputNumberformatter = NumberFormatter()
        inputNumberformatter.numberStyle = .decimal
        inputNumberformatter.maximumFractionDigits = 3
        let num = inputNumberformatter.number(from: ttBuyRt ?? "") ?? 0
        return inputNumberformatter.string(from: num)
    }
    
    func getBankBuyAt() -> String?{
        let inputNumberformatter = NumberFormatter()
        inputNumberformatter.numberStyle = .decimal
        inputNumberformatter.maximumFractionDigits = 3
        let num = inputNumberformatter.number(from: bankBuyRt ?? "") ?? 0
        return inputNumberformatter.string(from: num)
    }
}
