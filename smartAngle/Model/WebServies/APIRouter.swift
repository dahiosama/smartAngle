//
//  APIRouter.swift
//  Conson
//
//  Created by osama on 12/7/20.
//  Copyright © 2020 osama. All rights reserved.
//

import Foundation
import Alamofire
enum APIRouter: URLRequestConvertible {
    
    // MARK: - Student

    case settings
    case getProfile
   
//    case requestNewCode //MARKR:- TODO
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
      
            
        case .settings:
            return .get
        case .getProfile:
            return .get
 
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
            
            
       
        case .settings:
            return "settings"
        case .getProfile:
            return "api/test/provider/3"
        
        }
    }
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
       
            
        case .settings:
            return nil
        case .getProfile:
            return nil
 
        }
        
    }
    // MARK: - headers
    private  var headers: [String:String]? {
        switch self {
            
        
        case .settings:
            return nil
            
        case .getProfile:
            return nil
   
        }
        
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.ProductionServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        //  urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.setValue("Accept-Language", forHTTPHeaderField: "en")
        if let heder = headers {
            if heder.isEmpty {
                print("Notoken")
            }else{
                loadUser { (error, user) in
                    if user?.accsesToken != nil {
                        
                        let token = user?.accsesToken
                        //                        let fcmtoken = user?.fcmToken
                        urlRequest.setValue("Bearer \(token ?? "")", forHTTPHeaderField:"Authorization")
                        //                        urlRequest.setValue("\(fcmtoken ?? "")", forHTTPHeaderField: "fcmToken")
                        print(token,"headers")
                        //                        print(user?.fcmToken , "headers")
                    }else {
                        //                        let fcmtoken = user?.fcmToken
                        
                        //                        urlRequest.setValue("\(fcmtoken ?? "")", forHTTPHeaderField: "fcmToken")
                        
                    }
                    
                    
                }
            }
            
        }
        
        if let parameters = parameters {
            do {
                
                let par = try JSONSerialization.data(withJSONObject: parameters, options: [])
                
                urlRequest.httpBody = par
                print(parameters)
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
        
    }
    
}

//
class TestNetowrk {

//    static func getPages(page:String,completion:@escaping (Pages? , _ error:Error?)->Void){
//
//
//           let heders:HTTPHeaders = [
//               "Accept":"application/json",
//           ]
//           AF.request("http://www.conso.hexacit.com/api/V1/getPages?page_name=\(page)", method:.get ,encoding: URLEncoding.default,headers: heders)
//               .responseJSON { (response) in
//                   print(response,"-->>")
//
//                   switch response.result{
//                   case.success( _):
//                       do {
//                           let decoder = JSONDecoder()
//                           let data = try decoder.decode(Pages.self, from: response.data!)
//                           completion(data , nil)
//
//                       }
//                       catch let jsonError{
//                           print(jsonError)
//                       }
//                   case .failure(let error):
//                       print("error")
//                       completion(nil , error)
//                   }
//           }
//       }
//       
    
    
    
//    static func searchBycategory(text:String,completion:@escaping (CategoryModel? , _ error:Error?)->Void){
//
//
//           let heders:HTTPHeaders = [
//               "Accept":"application/json",
//           ]
//           AF.request("http://www.conso.hexacit.com/api/V1/searchBycategory?text=\(text)", method:.get ,encoding: URLEncoding.default,headers: heders)
//               .responseJSON { (response) in
//                   print(response,"-->>")
//
//                   switch response.result{
//                   case.success( _):
//                       do {
//                           let decoder = JSONDecoder()
//                           let data = try decoder.decode(CategoryModel.self, from: response.data!)
//                           completion(data , nil)
//
//                       }
//                       catch let jsonError{
//                           print(jsonError)
//                       }
//                   case .failure(let error):
//                       print("error")
//                       completion(nil , error)
//                   }
//           }
//       }
//
//
//
//    static func getConsulting(orderBy:String,category_id:Int,page:Int,completion:@escaping (Consulting? , _ error:Error?)->Void){
//
//
//        let heders:HTTPHeaders = [
//            "Accept":"application/json",
//        ]
//        AF.request("http://www.conso.hexacit.com/api/V1/counselBycategory?orderBy=\(orderBy)&category_id=\(category_id)&page=\(page)", method:.get ,encoding: URLEncoding.default,headers: heders)
//            .responseJSON { (response) in
//                print(response,"-->>")
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode(Consulting.self, from: response.data!)
//                        completion(data , nil)
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//        }
//    }
//
//
//
//    static func getConsultingDetiels(Id:Int,completion:@escaping (ConsultingDetiles? , _ error:Error?)->Void){
//
//
//           let heders:HTTPHeaders = [
//               "Accept":"application/json",
//           ]
//           AF.request("http://www.conso.hexacit.com/api/V1/counselDetails?counsel_id=\(Id)", method:.get ,encoding: URLEncoding.default,headers: heders)
//               .responseJSON { (response) in
//                   print(response,"-->>")
//
//                   switch response.result{
//                   case.success( _):
//                       do {
//                           let decoder = JSONDecoder()
//                           let data = try decoder.decode(ConsultingDetiles.self, from: response.data!)
//                           completion(data , nil)
//
//                       }
//                       catch let jsonError{
//                           print(jsonError)
//                       }
//                   case .failure(let error):
//                       print("error")
//                       completion(nil , error)
//                   }
//           }
//       }
//
//
//
//
//    static func getallCounseRates(Id:Int,completion:@escaping (Comment? , _ error:Error?)->Void){
//
//
//        let heders:HTTPHeaders = [
//            "Accept":"application/json",
//        ]
//        AF.request("http://www.conso.hexacit.com/api/V1/allCounseRates?counsel_id=\(Id)", method:.get ,encoding: URLEncoding.default,headers: heders)
//            .responseJSON { (response) in
//                print(response,"-->>")
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode(Comment.self, from: response.data!)
//                        completion(data , nil)
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//        }
//    }
//
//
//    static func chargetWallet(token:String ,amount:String,completion:@escaping (LoginModel? , _ error:Error?)->Void){
//
//
//        let heders:HTTPHeaders = [
//            "Accept":"application/json",
//            "Authorization": token
//        ]
//        AF.request("http://www.conso.hexacit.com/api/V1/chargetWallet?amount=\(amount)", method:.get ,encoding: URLEncoding.default,headers: heders)
//            .responseJSON { (response) in
//                print(response,"-->>")
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode(LoginModel.self, from: response.data!)
//                        completion(data , nil)
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//        }
//    }
//
//
    
}
//
//    static func SendAssignments(title:String,body:String,section:Int,groups:String,last_date:String,
//                                type :String, token:String,completion:@escaping (assignmentsObject? , _ error:Error?)->Void){
//
//
//           let heders:HTTPHeaders = [
//               "Authorization":token,
//               "Accept":"application/json",
//           ]
//
//        let parmeter:Parameters = ["title":title,
//                                   "body":body,
//                                   "section":section,
//                                   "groups":groups,
//                                   "last_date":last_date,
//                                   "type":type
//
//        ]
//        AF.request("https://elite.edu.ps/api/teachers/assignments/store", method:.post ,parameters:parmeter, encoding: URLEncoding.default,headers: heders)
//               .responseJSON { (response) in
//                   print(response,"-->>")
//
//                   switch response.result{
//                   case.success( _):
//                       do {
//                           let decoder = JSONDecoder()
//                           let data = try decoder.decode(assignmentsObject.self, from: response.data!)
//                           completion(data , nil)
//
//                       }
//                       catch let jsonError{
//                           print(jsonError)
//                       }
//                   case .failure(let error):
//                       print("error")
//                       completion(nil , error)
//                   }
//           }
//       }
//    static func Awards(level:Int,token:String,completion:@escaping (AwardsObject? , _ error:Error?)->Void){
//
//        let heders:HTTPHeaders = [
//
//            "Authorization":token,
//            "Accept":"application/json",
//        ]
//        AF.request("https://elite.edu.ps/api/students/points/awards?level=\(level)", method:.get ,encoding: URLEncoding.default,headers: heders)
//            .responseJSON { (response) in
//                print(response,"-->>")
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode(AwardsObject.self, from: response.data!)
//                        completion(data , nil)
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//
//        }
//    }
//
//    static func skiles(level:Int,token:String,completion:@escaping (SkilesObject? , _ error:Error?)->Void){
//
//        let heders:HTTPHeaders = [
//
//            "Authorization":token,
//            "Accept":"application/json",
//        ]
//        AF.request("https://elite.edu.ps/api/students/points/items?type=all&level=\(level)", method:.get ,encoding: URLEncoding.default,headers: heders)
//            .responseJSON { (response) in
//                print(response,"-->>")
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode(SkilesObject.self, from: response.data!)
//                        completion(data , nil)
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//
//        }
//    }
//    static func TESkiles(level:Int,token:String,completion:@escaping (TESkilesObject? , _ error:Error?)->Void){
//
//        let heders:HTTPHeaders = [
//
//            "Authorization":token,
//            "Accept":"application/json",
//        ]
//        AF.request("https://elite.edu.ps/api/teachers/points/\(level)/items?type=all", method:.get ,encoding: URLEncoding.default,headers: heders)
//            .responseJSON { (response) in
//                print(response,"-->>")
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode(TESkilesObject.self, from: response.data!)
//                        completion(data , nil)
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//
//        }
//    }
//
//    class func uploadPhoto(_ url: String, image: UIImage?, params: [String : Any], header: [String:String],completion:@escaping (DeletPostObject? , _ error:Error?) ->Void) {
//        let httpHeaders = HTTPHeaders(header)
//        AF.upload(multipartFormData: { multiPart in
//            for p in params {
//                multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
//            }
//            multiPart.append((image?.jpegData(compressionQuality: 0.7)!)! ,withName: "image", mimeType: "image/png")
//        }, to: url, method: .post, headers: httpHeaders) .uploadProgress(queue: .main, closure: { progress in
//            print("Upload Progress: \(progress.fractionCompleted)")
//        }).responseJSON(completionHandler: { data in
//            print("upload finished: \(data)")
//
//        }).response { (response) in
//            switch response.result {
//            case .success(let resut):
//                print("upload success result: \(DeletPostObject.self)")
//                //                completion(DeletPostObject,nil)
//
//            case .failure(let err):
//                completion(nil,err)
//                print("upload err: \(err)")
//            }
//        }
//    }
//
//
//
//
//
//    static func serch(token:String ,Id:Int,completion:@escaping (workSheet? , _ error:Error?)->Void){
//
//
//        let heders:HTTPHeaders = [
//            "Accept":"application/json",
//            "Accept-Language": "en",
//            "Authorization":token
//        ]
//        AF.request("https://elite.edu.ps/api/students/worksheets?course_id=\(Id)", method:.get ,encoding: URLEncoding.default,headers: heders)
//            .responseJSON { (response) in
//                print(response,"-->>")
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode(workSheet.self, from: response.data!)
//                        completion(data , nil)
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//
//        }
//    }
//
//
//
//
//
//    static func TetchergetAssignments(token:String,completion:@escaping (TestchWorkPaperObject? , _ error:Error?)->Void){
//
//
//           let heders:HTTPHeaders = [
//               "Authorization":token,
//               "Accept":"application/json",
//           ]
//           //        https://elite.edu.ps/api/
//           AF.request("https://elite.edu.ps/api/teachers/assignments?type=worksheet", method:.get ,encoding: URLEncoding.default,headers: heders)
//               .responseJSON { (response) in
//                   print(response,"-->>")
//
//                   switch response.result{
//                   case.success( _):
//                       do {
//                           let decoder = JSONDecoder()
//                           let data = try decoder.decode(TestchWorkPaperObject.self, from: response.data!)
//                           completion(data , nil)
//
//                       }
//                       catch let jsonError{
//                           print(jsonError)
//                       }
//                   case .failure(let error):
//                       print("error")
//                       completion(nil , error)
//                   }
//           }
//       }
//
//
//
//
//    static func Plane(Id:Int,completion:@escaping (workSheet? , _ error:Error?)->Void){
//
//
//        let heders:HTTPHeaders = [
//            "Accept":"application/json",
//            "Accept-Language": "en",
//            "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjgwNGVlYjRhZjQ4OWZhZTJjNTE5NjdmNmI3NjllOGZkOWYzMTEwYzc0ODA1OTU1YjhkNTliMzg4ODc1Yzg1MjljZTJkOGE1ZjVhNjYyMjk5In0.eyJhdWQiOiIyIiwianRpIjoiODA0ZWViNGFmNDg5ZmFlMmM1MTk2N2Y2Yjc2OWU4ZmQ5ZjMxMTBjNzQ4MDU5NTViOGQ1OWIzODg4NzVjODUyOWNlMmQ4YTVmNWE2NjIyOTkiLCJpYXQiOjE1OTcwNjE4OTQsIm5iZiI6MTU5NzA2MTg5NCwiZXhwIjoxNjI4NTk3ODk0LCJzdWIiOiIyNzEiLCJzY29wZXMiOltdfQ.fie5DN6X_x03XqNyQUvzEar5iVOyx_II8gcJaFCI2k50JmVSTHSchQa5_fF78l5lI1glC3vKaMzTeRiAjDlWe2OCCPncbfclxZHhEPQtUI9JyN5eO9szvPz6fcWtjiAfyNZ4l4SeAQuvCGfZmIshmBlaVHCcmK1u0ZmXDc-NzHSWwqbNUt6v8NNvJWkVig_YEYB7AM-gQ-VBFf9kOYpYyfzFWfocBDIgb5u0cEzciQWiVrdgQvqNLNc4MXPv-84_GThJp2HIzhaMLedOEIwKv-jfqAVOf1TT7SzGZd645GtTmpY56CbnjR3EzpvAOKaig2ZGbKRiOTPWbFLksT7yjxKDszbhDAP-GiRWlQUTYjY8ZAReValBthn38ZTQL_F07Ffyvr3PpI-zoPyv1IrQrhzOH_gL8cQDREdsgxwFANtTL-gFFQJwTzMdmMeGmTZxiGKK4Otku69hKF1phBLAQQj11G54SQyGEUoP7tuzM5cAOiuoKWZQHx-FgaaC4iK7KsDKTbDAG65C72GYJ_QMLXnvTykChFPjKEI2MrpTrlftEvm3DBB9etuRmiEXPNjaTUIL6jjD1o-rb9cWcdNCaXH0H0Opz7tC3i2nC6cuBX2nV8A9dPYiaaWVk0pYCsZPAKkhAQQX5Hp9acmK61yJF4qGkVzTceWbWhUtZ5QOhUQ"
//        ]
//        AF.request("https://elite.edu.ps/api/students/worksheets?course_id=\(Id)", method:.get ,encoding: URLEncoding.default,headers: heders)
//            .responseJSON { (response) in
//                print(response,"-->>")
//
//                switch response.result{
//                case.success( _):
//                    do {
//                        let decoder = JSONDecoder()
//                        let data = try decoder.decode(workSheet.self, from: response.data!)
//                        completion(data , nil)
//
//                    }
//                    catch let jsonError{
//                        print(jsonError)
//                    }
//                case .failure(let error):
//                    print("error")
//                    completion(nil , error)
//                }
//
//        }
//    }
//
//
//}




