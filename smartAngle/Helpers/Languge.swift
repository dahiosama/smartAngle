//
//  Languge.swift
//  Conson
//
//  Created by osama on 12/7/20.
//  Copyright © 2020 osama. All rights reserved.
//

import Foundation

class Language{
    
    static var isEnlgishLang : Bool {
        return !currentLanguage.contains("ar")
    }
    
    static var isArabicLang : Bool {
        return currentLanguage.contains("ar")
    }

    static var LanguageTitle : String {
        return !currentLanguage.contains("ar") ? "English" : "عربي"
    }

    static var currentLanguage : String {
        return Locale.current.languageCode ?? ""
//        let ns = UserDefaults.standard
//        let langs = ns.value(forKey: "AppleLanguages") as! NSArray
//        let firstLang = langs.firstObject as! String
//        return firstLang
    }
    
    class func setAppLanguage(lang:LangType){
        let ns = UserDefaults.standard
        ns.setValue([lang.value, currentLanguage], forKey: "AppleLanguages")
        ns.synchronize()
    }
}

enum LangType {
    case Arabic
    case English
    
    var value : String {
        switch self {
        case .Arabic:
            return "ar"
        case .English:
            return "en"
        }
    }
}
