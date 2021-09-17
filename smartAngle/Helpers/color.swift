//
//  color.swift
//  iOSProject2020
//
//  Created by osama on 11/20/20.
//

import Foundation
import UIKit

let MAINCOlOR      = "410F5D".color
let RED_COLOR   = "FA1010".color
let GRAY_D8D8D8    = "D8D8D8".color
let DRAKGRAY_COLOR = "303933".color
let COLOR_39475A   = "39475A".color
let COLOR_A4ADB5   = "A4ADB5".color
let COLOR_EB3B5A   = "EB3B5A".color
let GRAY_F5F5F5    = "F5F5F5".color
extension String{
    
    func format(args: CVarArg...) -> String {
      return String(format: self, arguments: args)
    }
    
//    var toPriceString: String {
//        if Language.isArabicLang {
//            return self + SR_CURRENCY
//        }
//
//        return SR_CURRENCY + self
//    }

    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    var containsWhitespace : Bool {
        return (self.rangeOfCharacter(from: .whitespacesAndNewlines) != nil)
    }
    
    var containtSpecialCharacter : Bool {
        let characterset = CharacterSet(charactersIn: "!@#$%^&*()=<>?/\';~`٫±§")
        //"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_")
        return self.rangeOfCharacter(from: characterset) != nil ?  true : false
    }
    
    var validUserName : Bool {
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.-_")
        return rangeOfCharacter(from: characterset) != nil
    }

    
    //cut first caracters from full names
    public func getAcronyms(separator: String = "") -> String {
        let acronyms = self.components(separatedBy: " ").map({ String($0.first!) }).joined(separator: separator);
        return acronyms;
    }
    
    //remove spaces from text
    var trimmed:String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var prepareFilterFirstString : String {
        return self.trimmed.first?.description ?? ""
    }
    
    var isEmailValid: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    var isMobileBegin05: Bool {
        return self.hasPrefix("05")
//        do {
//            let regStr2 =  "^[05]"
//            let regex = try NSRegularExpression(pattern: regStr2, options: .caseInsensitive)
//            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
//        } catch {
//            return false
//        }
    }
    
    var isMobileBegin0: Bool {
        return self.hasPrefix("0")
//        do {
//            let regStr2 =  "^[0]"
//            let regex = try NSRegularExpression(pattern: regStr2, options: .caseInsensitive)
//            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
//        } catch {
//            return false
//        }
    }

    var isMobileBegin5: Bool {
        return self.hasPrefix("5")
//        do {
//            let regStr2 =  "^[5]"
//            let regex = try NSRegularExpression(pattern: regStr2, options: .caseInsensitive)
//            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
//        } catch {
//            return false
//        }
    }

    
    var isMobileValid: Bool {
        do {
            let regStr2 =  "^(1)?[0-9]{3}?[0-9]{3}?[0-9]{4}$"
            let regex = try NSRegularExpression(pattern: regStr2, options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    var isSAMobileValid: Bool {
        do {
            let regStr2 =  "^?!(0)[0-9]{9}$"
            let regex = try NSRegularExpression(pattern: regStr2, options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    
    var isUrlValid : Bool {
        if let url = URL.init(string: self){
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    var isEmptyStr:Bool{
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var color: UIColor {
        let colorStr = self.removeHash
        
        let hex = colorStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return UIColor.clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    var cgColor: CGColor {
        return self.color.cgColor
    }
    
    var removeHash: String {
        return self.replacingOccurrences(of: "#", with: "")
    }
    
    var TrimAllSpaces:String {
        return self.components(separatedBy: .whitespacesAndNewlines).joined()
    }
    
    var TrimWhiteSpaces:String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    
    var enhanceNewLine:String {
        var str = self.replacingOccurrences(of: "\\n", with: "\n")
        str  = str.replacingOccurrences(of: "\r", with: "")
        str  = str.replacingOccurrences(of: "&amp;", with: "and")
        return str.replacingOccurrences(of: "\\'", with: "'")
    }
    
    func height(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.height
    }
    
    func width(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return boundingBox.width
    }
    
    
    
    func stringSize()-> CGSize {
        let size  = (self as NSString).size(withAttributes: nil)
        return size
    }
    
    var removeHtmlTags:String {
        //        return   self.replacingOccurrences(of: "<div*></div>", with: "")
        let regex:NSRegularExpression  = try! NSRegularExpression(  pattern: "<.*?>", options: .caseInsensitive)
        let range = NSMakeRange(0, self.count)
        let htmlLessString :String = regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(), range:range , withTemplate: "")
        
        return htmlLessString.replacingOccurrences(of: "&amp;", with: "")
    }
    
    var toImage: UIImage {
        if self == "" {
            return UIImage()
        }else{
            let img = UIImage(named: self) ?? UIImage()
            return img
        }
    }
    
    func func_ArNumberToEn() -> String {
        let Formatter: NumberFormatter = NumberFormatter()
        Formatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
        let finaltxtNo = Formatter.number(from: self)
        return "00\(finaltxtNo!)"
    }
    
    func func_TrimCharacters() -> String {
        let result = self.trimmingCharacters(in: CharacterSet(charactersIn: "01234567890.").inverted)
        return  "\(result)"
    }
    
    func replacePlusInCountryCode() -> String {
        let result = self.replacingOccurrences(of: "+", with: "00")
        return  "\(result)"
    }
    
    func replaceZeroInCountryCode() -> String {
        let result = self.replacingOccurrences(of: "00", with: "+")
        return  "\(result)"
    }
    
    var func_replaceZerosInCountruCode : String {
        let result = self.dropFirst(2).description
        return  "+\(result)"
    }
    
    func replacingCharacter(newStr:String,range:NSRange) -> String {
        let str = NSString(string: self).replacingCharacters(in: range, with : newStr) as NSString
        return String(str)
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func func_setUpFontawsomeIconOld() -> String {
        let icon = self.dropFirst(6).description.capitalizingFirstLetter()
        return icon
    }
    func func_setUpFontawsomeIcon() -> String {
        let icon = self.dropFirst(3).description
        return icon
    }
    
    func toDateUTC(_ defaultFormat: String = "yyyy-MM-dd HH:mm:ss") -> Date {
        
        let toDate = DateFormatter()
        toDate.dateFormat = defaultFormat
        toDate.locale = Locale(identifier: "en")
        toDate.timeZone = TimeZone(identifier: "UTC")
        let newDate = toDate.date(from: self)
        return newDate ?? Date()
    }
    
    func toDate(_ defaultFormat: String = "yyyy-MM-dd HH:mm:ss") -> Date {

        let toDate = DateFormatter()
        toDate.dateFormat = defaultFormat
        toDate.locale = Locale(identifier: "en")
        let newDate = toDate.date(from: self)
        return newDate ?? Date()
    }

    
    var addPercentageValue : String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
    }
    
    func fromJSON() -> [String: Any] {
        let data = self.data(using: .utf8)!
        do {
            if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String: Any]
            {
                return jsonArray // use the json here
            } else {
                return [:]
            }
        } catch _ as NSError {
            return [:]
        }
    }
    
    var containUnnecessaryChar : Bool {
        let characterset = CharacterSet(charactersIn: "0123456789.").inverted
        return self.rangeOfCharacter(from: characterset) != nil ?  true : false
    }
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
}
