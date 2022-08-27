//
//  NetworkWorker.swift
//  ExamExasyCom
//
//  Created by Ryan E on 8/27/22.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

enum MimeTypes: String {
    case jpeg = "image/jpeg"
    case png = "image/png"
}

struct NetworkWorker {
    static func POST(urlString: String, params: [String: Any], token: String?, completion: @escaping (_ response: JSON?, _ error: JSON?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(nil, "URL Error")
            return
        }
        
        print("URL: \(urlString)")
        print("Params: \(params)")
        
        var headerItems: [String: String] = ["Accept": "application/json"]
        
        if token != nil {
            headerItems["x-token"] = token!
        }
        
        let headers: HTTPHeaders = headerItems
        print(headers)
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { (response) in
                print(response)
                
                response.result.ifSuccess {
                    guard let value = response.result.value else {
                        print("Error in response value: \(String(describing: response.result.error))")
                        completion(nil, JSON(response.data!))
                        return
                    }
                    completion(JSON(value), nil)
                }
                
                response.result.ifFailure {
                    print("Error in request: \(String(describing: response.result.error))")
                    completion(nil, JSON(response.data!))
                    return
                }
        }
    }
    
    static func PATCH(urlString: String, params: [String: Any], token: String?, completion: @escaping (_ response: JSON?, _ error: JSON?) -> Void) {
            
        guard let url = URL(string: urlString) else {
            completion(nil, "URL Error")
            return
        }
            
        print("URL: \(urlString)")
        print("Params: \(params)")
            
        var headerItems: [String: String] = ["Accept": "application/json"]
        //var headerItems: [String: String] = ["Content-Type": "application/x-www-form-urlencoded"]
            
        if token != nil {
            headerItems["x-token"] = token!
        }
            
        let headers: HTTPHeaders = headerItems
        print(headers)
            
        Alamofire.request(url, method: .patch, parameters: params, encoding: JSONEncoding.default, headers: headers)
                .validate()
                .responseJSON { (response) in
                    print(response)
                    
                    response.result.ifSuccess {
                        guard let value = response.result.value else {
                            print("Error in response value: \(String(describing: response.result.error))")
                            completion(nil, JSON(response.data!))
                            return
                        }
                        completion(JSON(value), nil)
                    }
                    
                    response.result.ifFailure {
                        print("Error in request: \(String(describing: response.result.error))")
                        completion(nil, JSON(response.data!))
                        return
                    }
            }
        }
    
    static func GET(urlString: String, token: String?, completion: @escaping (_ data: Data?, _ response: JSON?, _ error: JSON?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, nil, "URL Error")
            return
        }
        
        var headerItems: [String: String] = ["Accept": "application/json"]
    
        if token != nil {
            headerItems["x-token"] = token!
        }
        
         let headers: HTTPHeaders = headerItems
        //let headers: HTTPHeaders? = nil
         print(headers)
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { (response) in
                print(response)
                
                response.result.ifSuccess {
                    guard let value = response.result.value else {
                        print("Error in response value: \(String(describing: response.result.error))")
                        completion(response.data! ,nil, JSON(response.data!))
                        return
                    }
                    completion(response.data,JSON(value), nil)
                }
                
                response.result.ifFailure {
                    print("Error in request: \(String(describing: response.result.error))")
                    completion(response.data, nil, JSON(response.data!))
                    return
                }
        }
    }
    
    static func DELETE(urlString: String, token: String?, completion: @escaping (_ response: JSON?, _ error: JSON?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, "URL Error")
            return
        }
        
        var headerItems: [String: String] = ["Accept": "application/json"]
    
        if token != nil {
            headerItems["x-token"] = token!
        }
        
         let headers: HTTPHeaders = headerItems
        //let headers: HTTPHeaders? = nil
         print(headers)
        
        Alamofire.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { (response) in
                print(response)
                
                response.result.ifSuccess {
                    guard let value = response.result.value else {
                        print("Error in response value: \(String(describing: response.result.error))")
                        completion(nil, JSON(response.data!))
                        return
                    }
                    completion(JSON(value), nil)
                }
                
                response.result.ifFailure {
                    print("Error in request: \(String(describing: response.result.error))")
                    completion(nil, JSON(response.data!))
                    return
                }
        }
    }
}
