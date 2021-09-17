//
//  Network.swift
//  Conson
//
//  Created by osama on 12/7/20.
//  Copyright © 2020 osama. All rights reserved.
//

import Foundation
import Alamofire
struct NetworkClient {
    
    // Define Error and Success Type
    
    //MARK: - Ginaric Request Function
    
    static func Request<T>(_ controller : UIViewController,_ object: T.Type, router: APIRouter, baseURl:String = Constant.ProductionServer.baseURL,_ isLoding:Bool,respons: @escaping ((T?, _ error: Error? ) -> ()))
    
    where T: Decodable{
        
        if isLoding{
            controller.showIndicator()

        }
        if Networke.Netwoke.connectedToNetwork(){
        
            //controller.showHUDLoder()
            AF.request(router).responseJSON { (response) in
//                print(response.result,"Test")
                
                let code:Int = response.response?.statusCode ?? 600
                switch code {
        
                case 400:
                    print("statusCode ---> \(code)")
                    controller.hideIndicator()
                    controller.showToast("Bad Request")
                case 401:
                    print("statusCode ---> \(code)")
                    controller.hideIndicator()
                    controller.showToast("Unauthorized")
                case 404:
                    print("statusCode ---> \(code)")
                    controller.hideIndicator()
                    controller.showToast("Not Found")
                case 403:
                    print("statusCode ---> \(code)")
                    controller.hideIndicator()
                    controller.showToast("FORBIDDEN")
                case 405:
                    print("statusCode ---> \(code)")
                    controller.hideIndicator()
                    controller.showToast("METHOD NOT ALLOWED")
                case 500:
                    print("statusCode ---> \(code)")
                    controller.hideIndicator()
                    controller.showToast("Internal Server Error")
                case 200 :
                    
                    print("statusCode ---> \(code)")
                    switch response.result{
                    case .success( _):
                        do {
                            let decoder = JSONDecoder()
                            let data = try decoder.decode(T.self, from: response.data!)
                            print(response.result,"Test")
                            respons(data, nil )

                            DispatchQueue.main.async {
                                
                                controller.hideIndicator()

                            }
                            
                            
                        }
                        catch let jsonError{
                            controller.dismiss(animated: true, completion: nil)
                            respons(nil,jsonError )
                            print(jsonError.localizedDescription)
                            DispatchQueue.main.async {
                                
                                controller.hideIndicator()
                            }
                            
                            print(jsonError)
                            print(jsonError.localizedDescription)
                            
                            controller.showToast(jsonError.localizedDescription )
                        }
                    case .failure(let error):
                        controller.dismiss(animated: true, completion: nil)
                        respons(nil,error )
                        print(error.localizedDescription)
                        DispatchQueue.main.async {
                            
                            controller.hideIndicator()
                        }
                        
                        print(error)
                        print(error.localizedDescription)
                        controller.showToast(error.localizedDescription )
                        
                    }
                    
                default:
                    controller.showToast("UnKown Error")

                }
            }

//            respons(nil,nil ) Fuck you <---
        }else{
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                controller.hideIndicator()
                controller.showToastNoInternt()
//                controller.showAlertNoInternt()
                print("NO INTRINT CONICTION")
            }

          
            
        }
    }
}




