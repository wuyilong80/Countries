//
//  ViewController.swift
//  Countries
//
//  Created by Lawrence on 2023/3/8.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    let session: WCSession = .default
    
    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .red
        
//        if WCSession.isSupported() {
//            session.delegate = self
//            session.activate()
//        }
    }

    @IBAction func testButtonClicked(_ sender: Any) {
        WatchSessionManager.sharedManager.transferFile()
//        session.sendMessage(["test": "test"], replyHandler: nil)
    }
}

extension ViewController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if let error {
            print("session activation failed with error: \(error.localizedDescription)")
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        session.activate()
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("get some message from watch.")
    }
    
}
