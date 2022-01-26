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

    }
    
    struct Output {

    }
    
    struct InOut {
        
    }
    
    var input = Input()
    let output = Output()
    let inOut = InOut()
    
    init() {
        
    }
    
}
