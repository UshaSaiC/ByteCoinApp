//
//  CoinModel.swift
//  ByteCoinApp
//
//  Created by Usha Sai Chintha on 09/09/22.
//

import Foundation

// it basically helps to get the formatted output
struct CoinModel{
    let rate: Double
    let currency: String
    
    var currencyRateString: String{
        String(format: "%.2f", rate)
    }
}
