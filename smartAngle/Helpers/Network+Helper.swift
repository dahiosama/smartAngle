//
//  Network+Helper.swift
//  Conson
//
//  Created by osama on 12/7/20.
//  Copyright © 2020 osama. All rights reserved.
//

import Foundation
//
//  Network.swift
//  Yalg
//
//  Created by osama abu dahi on 22/02/2020.
//  Copyright © 2020 osama abu dahi. All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration

/*
 reachability?.stopNotifier()
 NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: reachability)
 */
struct checkNetwork {
   static let reachability = Reachability()
}
extension UIViewController {
   
    
     func handleReachability() {
        NotificationCenter.default.addObserver(forName: .reachabilityChanged, object: checkNetwork.reachability, queue: .main) { (notification) in
            if let MyRechability = notification.object as? Reachability {
                switch MyRechability.connection {
                case .cellular:
                    print("Mobile Data")
                    
//                    self.displayMessage(message: "Connected by cellular data", messageError: false)
                case .wifi:
                     print("wifi")
                   // self.displayMessage(message: "Connected by Wifi", messageError: false)
                case .none:
                    print("No conection")
                  //  self.displayMessage(message: "No Internet Connection", messageError: true)
                }
            }
        }
}
}
public struct Networke:Any {
    
    static var Netwoke = Networke()
   public func connectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
