//
//  ViewController.swift
//  TCRequest
//
//  Created by 玮 李 on 2017/5/6.
//  Copyright © 2017年 玮 李. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        TCRequest.request("http://www.lightonline.com.cn:8080/ad_abc/ip/getArea", par: nil, method: .get, successed: { (data) in
            guard let dic = data as? NSDictionary else {return}
            print(dic)
        }) { (error) in
            if error?._code == NSURLErrorTimedOut {
                print("网络超时")
            }
            print(error.debugDescription)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

