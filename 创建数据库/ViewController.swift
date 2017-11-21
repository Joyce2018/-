//
//  ViewController.swift
//  创建数据库
//
//  Created by YYY on 2017/11/20.
//  Copyright © 2017年 成品家（北京）网路科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let array: [[String: AnyObject]] = [["idstr": "1001" as AnyObject, "text": "微博1001sdfdsfjskfdsk" as AnyObject],
                                            ["idstr": "1002" as AnyObject, "text": "微博1002" as AnyObject],
                                            ["idstr": "1003" as AnyObject, "text": "微博1003" as AnyObject],
                                            ["idstr": "1004" as AnyObject, "text": "微博1004" as AnyObject],
                     ["idstr": "1005" as AnyObject, "text": "微博1005" as AnyObject],
                     ["idstr": "1006" as AnyObject, "text": "微博1006" as AnyObject],
                     ["idstr": "1007" as AnyObject, "text": "微博1007" as AnyObject],
                     ["idstr": "1008" as AnyObject, "text": "微博1008" as AnyObject],
                     ["idstr": "1009" as AnyObject, "text": "微博1009" as AnyObject],
                     ["idstr": "1010" as AnyObject, "text": "微博1010" as AnyObject],
                     ["idstr": "1011" as AnyObject, "text": "微博1011" as AnyObject],
                     ["idstr": "1012" as AnyObject, "text": "微博1012" as AnyObject],
                     ["idstr": "1013" as AnyObject, "text": "微博1013" as AnyObject],
                     ["idstr": "1014" as AnyObject, "text": "微博1014" as AnyObject],
                     ["idstr": "1015" as AnyObject, "text": "微博1015" as AnyObject],
                     ["idstr": "1016" as AnyObject, "text": "微博1016" as AnyObject],
                     ["idstr": "1017" as AnyObject, "text": "微博1017" as AnyObject],
                     ["idstr": "1018" as AnyObject, "text": "微博1018" as AnyObject],
                     ["idstr": "1019" as AnyObject, "text": "微博1019" as AnyObject],
                     ["idstr": "1020" as AnyObject, "text": "微博1020" as AnyObject],
                     ["idstr": "1021" as AnyObject, "text": "微博1021" as AnyObject],
                     ["idstr": "1022" as AnyObject, "text": "微博1022" as AnyObject],
                     ["idstr": "1023" as AnyObject, "text": "微博1023" as AnyObject],
        ]
        
    
        SQLiteManager.shared.insertTable(userID: "101", array: array)
        //let newArray = SQLiteManager.shared.queryTable()
        
        //print(newArray)
    }

}

