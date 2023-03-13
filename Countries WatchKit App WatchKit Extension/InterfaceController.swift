//
//  InterfaceController.swift
//  Countries WatchKit App WatchKit Extension
//
//  Created by Lawrence on 2023/3/8.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    let session = WCSession.default
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var countries: [String] = ["Belgium", "USA", "UK", "India", "China", "Australia"]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        // This scope will call when watch app open.
        
        ReceiveManager.sharedManager.startSession()
        
//        if WCSession.isSupported() {
//            session.delegate = self
//            session.activate()
//        }
        
        setupTableView()
    }
    
    override func willActivate() {
        super.willActivate()
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        super.didDeactivate()
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
    
    func sendSomethingToPhone() {
        session.sendMessage(["test":"test"], replyHandler: nil)
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        sendSomethingToPhone()
        self.pushController(withName: "DetailInterfaceController", context: countries[rowIndex])
    }

}

extension InterfaceController: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error {
            print("session activation failed with error: \(error.localizedDescription)")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("did receive message.")
    }
}
