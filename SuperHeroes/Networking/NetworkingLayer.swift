//
//  NetworkingLayer.swift
//  SuperHeroes
//
//  Created by SBI Admin on 2020/06/21.
//  Copyright © 2020 Rhulani Ndhlovu. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

enum Router {
    case search(nameString: String)
    
    func path() -> String{
        switch self {
        case let .search(nameString):
            return "https://superheroapi.com/api/\(Constants.accessToken)/search/\(nameString)"
        }
    }
}

class NetworkingLayer: NSObject {
    // Get Method
    class func requestGETURL(_ router: Router, success:@escaping (Data) -> Void, failure:@escaping (Error) -> Void) {
        
        AF.request(router.path()).responseJSON { (responseObject) -> Void in
            
            switch responseObject.result {
                
            case .success(_):
                if let resJson = responseObject.data {
                    success(resJson)
                }
            case .failure(_):
                //let error : Error = responseObject.result.error!
                //failure(error)
                break
            }
            /*
            if responseObject.result.isSuccess {
                if let resJson = responseObject.data {
                    success(resJson)
                }
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            } */
        }
    }
}
