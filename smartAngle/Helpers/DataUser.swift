//
//  DataUser.swift
//  Gift
//
//  Created by mohammed on 5/5/20.
//  Copyright © 2020 Gift. All rights reserved.
//

import Foundation
import SystemConfiguration
import UIKit



class Helper {
    static func saveUserToken(token: String) {
           
           let def = UserDefaults.standard
           
           struct Key{ fileprivate static let UserToken = "FCMToken"}
           
           def.setValue(token, forKey: Key.UserToken)
           def.synchronize()
       }
     
       static func getUserToken() -> String? {
           let def = UserDefaults.standard
           return def.object(forKey: "FCMToken") as? String
       }
}
struct userModel: Codable {
    var accsesToken: String
    var first_name:String
    var last_name:String
    var email:String
    var id:Int
    var mobile:String
    var type:String
    var date_of_birth:Int
    var country_id:String
    var avatar:String
    var status:String
    var fcmToken:String

    
    
}

///saveUser(user: userModel(name: "mohammed"))
func saveUser(user : userModel) {
    if let encoded = try? JSONEncoder().encode(user) {
        let defaults = UserDefaults.standard
        defaults.set(encoded, forKey: "SavedUser")
    }
}
///loadUser { (error, user) in
///    if let user = user{
///        print("user:- ",user.name)
///    }else{
///        print(error)
///    }
///}
func loadUser(handler: (_ Error : Error? ,_ user : userModel? )-> Void){
    let defaults = UserDefaults.standard
    if let savedPerson = defaults.object(forKey: "SavedUser") as? Data {
        let decoder = JSONDecoder()
        if let loadedPerson = try? decoder.decode(userModel.self, from: savedPerson) {
            handler(nil,loadedPerson)
        }
    }else{
        handler(Error.self as? Error,nil)
    }
}
///removeUser()
func removeUser(){
     let defaults = UserDefaults.standard
    defaults.removeObject(forKey: "SavedUser")
//    WindowManger.show(.account, animated: true)
}
class Networkec: NSObject {
    
    static var Netwoke = Networkec()
    
//    func appFont(size: CGFloat) -> UIFont {
//
//        let font = UIFont(name: "Cairo-Bold", size: size)!
//        return font
//    }
    
    
//    func appFont(size: CGFloat) -> UIFont {
//           
//           let font = UIFont(name: "Cairo-Bold", size: size)!
//           return font
//       }
    
    func connectedToNetwork() -> Bool {
        
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
class CustomTabBarosama : UITabBar {
    @IBInspectable var height: CGFloat = 0.0

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        if height > 0.0 {
            sizeThatFits.height = height
        }
        return sizeThatFits
    }
}
