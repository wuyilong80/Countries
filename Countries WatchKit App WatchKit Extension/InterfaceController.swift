//
//  InterfaceController.swift
//  Countries WatchKit App WatchKit Extension
//
//  Created by Lawrence on 2023/3/8.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var countries: [String] = ["Belgium", "USA", "UK", "India", "China", "Australia"]
    
    override func awake(withContext context: Any?) {
        // This scope will call when watch app open.
        
        setupTableView()
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    // MARK: - Setup
    
    func setupTableView() {
        tableView.setNumberOfRows(countries.count, withRowType: "CountryRow")
        
        for i in 0 ..< countries.count {
            if let row = tableView.rowController(at: i) as? CountryRow {
                row.countryName.setText(countries[i])
            }
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        self.pushController(withName: "DetailInterfaceController", context: countries[rowIndex])
    }

}
