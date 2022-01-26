//
//  RateTableViewCellViewModel.swift
//  RateCalculator
//
//  Created by Bowie Tso on 25/1/2022.
//

import Foundation
import RxSwift
import RxCocoa

class RateTableViewCellViewModel:ViewModelType{
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
