//
//  WatchSessionManager.swift
//  Countries
//
//  Created by Lawrence on 2023/3/8.
//

import UIKit
import WatchConnectivity

class WatchSessionManager: NSObject, WCSessionDelegate {
    
    static let sharedManager = WatchSessionManager()
    private let session: WCSession? = WCSession.isSupported() ? WCSession.default : nil
    private var validSession: WCSession? {
        if let session = session, session.isPaired && session.isWatchAppInstalled {
            return session
        }
        //回傳有效且連接中且手錶APP開啟中的session
        return nil
    }
    
    private override init() {
        super.init()
    }
    
    func startSession() {
        if WCSession.isSupported() {
            session?.delegate = self
            session?.activate()
        }
    }
    
    func transferFile() {
//        if WCSession.isSupported() {
//            let test = "test"
//            session?.transferFile(URL(string: test)!, metadata: ["test":"test"])
//        }
        
//        try? session?.updateApplicationContext(["test": "test"])
        session?.sendMessage(["test": "test"], replyHandler: nil)
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        session.activate()
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
}
