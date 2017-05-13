# TCRequest

//example 

  TCRequest.request("URL", par: nil, method: .get, successed: { (data) in
            guard let dic = data as? NSDictionary else {return}
            print(dic)
        }) { (error) in
            if error?._code == NSURLErrorTimedOut {
                print("网络超时")
            }
            print(error.debugDescription)
        }
