//
//  CoinData.swift
//  ByteCoinApp
//
//  Created by Usha Sai Chintha on 09/09/22.
//

import Foundation

// it defines the structure of data obtained
struct CoinData: Codable{
    let rate: Double
    let asset_id_quote: String
}
