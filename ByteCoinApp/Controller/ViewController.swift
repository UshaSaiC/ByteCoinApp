//
//  ViewController.swift
//  ByteCoinApp
//
//  Created by Usha Sai Chintha on 09/09/22.
//

import UIKit

// UIPickerViewDataSource protocol ensure that now ViewController class is capable of providing any data to UIPickerViews
class ViewController: UIViewController{
    
    var coinManager = CoinManager()
    

    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    // provide info wrt number of columns needed in picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // provide info wrt number of rows needed in picker
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    // below method gives the name of title to be displayed on picker view as output. This method is called once for every row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    // below methods triggers when user scrolls the picker. When scrolled, this methods records the row number thats selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("currency : \(coinManager.currencyArray[row])")
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
    
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate{
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel){
        DispatchQueue.main.async {
            self.bitCoinLabel.text = coin.currencyRateString
            self.currencyLabel.text = coin.currency
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
