//
//  SpellingChecker
//
//  Created by 玮 李 on 2017/4/6.
//  Copyright © 2017年 玮 李. All rights reserved.
//


import Alamofire

class TCRequest: NSObject {
    //网络请求
    open class func request(_ url:String, par:Any?, method:HTTPMethod, successed:@escaping(_ responseObject: Any?) ->(), failed:@escaping (_ error: Error?) ->()) {
        let configuration = URLSessionConfiguration.default
        //超时时间
        configuration.timeoutIntervalForRequest =  10
        let sesionManager = Alamofire.SessionManager(configuration: configuration)
        
        sesionManager.request(url, method: method, parameters: par as? [String : Any]).responseJSON { (data) in
            sesionManager.session.invalidateAndCancel()
            switch data.result {
            case .success(let valued):
                successed(valued)
                break
            case .failure(let error):
                failed(error)
                break
            }
           
        }
        
    }
}

    
