//
//  RateViewModel.swift
//  RateCalculator
//
//  Created by Bowie Tso on 25/1/2022.
//

import Foundation
import RxCocoa
import RxSwift

class RateViewModel:ViewModelType{
    var disposeBag = DisposeBag()
    
    
    struct Input {
        var rateResponseBehaviorRelay = BehaviorRelay<HSBCRate?>(value: nil)
    }
    
    struct Output {
        var originalRateBehaviorRelay = BehaviorRelay<FxttExchangeRates?>(value: nil)
        var rateDiplayListBehaviorRelay = BehaviorRelay<[FxttExchangeRates]?>(value: nil)
    }
    
    struct InOut {
        
    }
    
    var input = Input()
    let output = Output()
    let inOut = InOut()
    
    init() {
        
        updateRate()
        
//        input.rateResponseBehaviorRelay.subscribe(onNext: { [weak self]tmp in
//            self?.output.originalRateBehaviorRelay.accept(tmp?.detailRates?.filter({$0.ccy == "CAD"}).first)
//            self?.output.rateDiplayListBehaviorRelay.accept(tmp?.detailRates?.filter({$0.ccy != "CAD"}))
//        }).disposed(by: disposeBag)
        
    }
    
    func updateRate(){
        NetworkManager().getHSBCExhangeRate()
            .map{$0.detailRates?.filter({$0.ccy != "MYR"})}
            .bind(to: output.rateDiplayListBehaviorRelay)
            .disposed(by: disposeBag)
    }
}
