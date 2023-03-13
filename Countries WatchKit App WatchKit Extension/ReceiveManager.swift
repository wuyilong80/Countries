//
//  ReceiveManager.swift
//  Countries WatchKit App WatchKit Extension
//
//  Created by Lawrence on 2023/3/10.
//

import UIKit

import WatchConnectivity

class ReceiveManager: NSObject, WCSessionDelegate {
    
    static let sharedManager = ReceiveManager()
    private let session: WCSession? = WCSession.isSupported() ? WCSession.default : nil
    
    private override init() {
        super.init()
    }
    
    func startSession() {
        if WCSession.isSupported() {
            session?.delegate = self
            session?.activate()
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("activationDidComplete.")
        
    }
    
    func session(_ session: WCSession, didReceive file: WCSessionFile) {
        print("receive something.")
    }
    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("did receive application context.")
    }
    
//    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
//        print("12313123")
//    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("did receive message on singleton.")
    }
    
    
}
