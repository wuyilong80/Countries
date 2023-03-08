//
//  DetailInterfaceController.swift
//  Countries WatchKit App WatchKit Extension
//
//  Created by Lawrence on 2023/3/8.
//

import WatchKit

class DetailInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var countryName: WKInterfaceLabel!
    @IBOutlet weak var capital: WKInterfaceLabel!
    @IBOutlet weak var currency: WKInterfaceLabel!
    @IBOutlet weak var flag: WKInterfaceImage!
    
    let capitals = ["Belgium":"Brussels",
                    "USA":"Washington DC",
                    "UK":"London",
                    "India":"New Delhi",
                    "China":"Beijing",
                    "Australia":"Canberra"]
    
    let currencies = ["Belgium":"EUR",
                      "USA":"USD",
                      "UK":"GBP",
                      "India":"INR",
                      "China":"CNY",
                      "Australia":"AUD"]
    let flags = ["Belgium":"be",
                 "USA":"us",
                 "UK":"gb",
                 "India":"in",
                 "China":"cn",
                 "Australia":"au"]
    
    override func awake(withContext context: Any?) {
        if let country = context as? String {
            countryName.setText(country)
            capital.setText(capitals[country])
            currency.setText(currencies[country])
            flag.setImage(UIImage.init(named: flags[country] ?? ""))
        }
    }
    
}
