//
//  ViewModelType.swift
//  RateCalculator
//
//  Created by Bowie Tso on 24/1/2022.
//

import Foundation
import RxSwift

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get }
//    func transform(input: Input) -> Output
}
