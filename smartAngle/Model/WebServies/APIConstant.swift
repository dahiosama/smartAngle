//
//  APIConstant.swift
//  Conson
//
//  Created by osama on 12/7/20.
//  Copyright © 2020 osama. All rights reserved.
//

import Foundation
import Alamofire
struct Constant {
    struct ProductionServer {

        static let baseURL = "https://apis.wjeez.host/"
    }
    //MARK: - API Parametr Key
    struct APIParameterKey {
        
    
        
        
        static let group = "group"
        static let assignment = "assignment"
//        static let file = "file"
//
        
    }
    
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
    case AcceptLanguage = "Accept-Language"
}
struct WebserviceConfig {
    /// Generates common headers specific to APIs. Can also accept additional headers if demanded by specific APIs.
    ///
    /// - Returns: A configured header in the form of JSON dictionary.
    func generateHeader() -> [String: String] {
        var headerDict = [String: String]()
        headerDict["Content-Type"] = "application/json"
        
        return headerDict
    }
}
