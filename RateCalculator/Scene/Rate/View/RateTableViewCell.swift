//
//  RateTableViewCell.swift
//  RateCalculator
//
//  Created by Bowie Tso on 25/1/2022.
//

import UIKit

class RateTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var countryFlagImageView: UIImageView!
    @IBOutlet weak var updownImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var rateValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadowView.roundCorners(cornerRadius: 15)
        shadowView.layer.applySketchShadow()
    }
    
    
    func uiBind(rate: FxttExchangeRates){
        countryLabel.text = rate.ccy
        rateValueLabel.text = rate.ttBuyRt
    }
}
