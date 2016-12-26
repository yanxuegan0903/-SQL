//
//  CountInfo.swift
//  模仿自动计数
//
//  Created by vsKing on 2016/12/26.
//  Copyright © 2016年 vsKing. All rights reserved.
//

import Foundation

class CountInfo: NSObject, NSCoding {
    
    var number:NSInteger = NSInteger.init()
    var count:NSInteger = NSInteger.init()
    var timeFrom:String = String.init()
    var timeTo:String = String.init()
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(number, forKey: "number")
        aCoder.encode(count, forKey: "count")
        aCoder.encode(timeFrom, forKey: "timeFrom")
        aCoder.encode(timeTo, forKey: "timeTo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.number = aDecoder.decodeInteger(forKey: "number")
        self.count = aDecoder.decodeInteger(forKey: "number")
        self.timeFrom = aDecoder.decodeObject(forKey: "timeFrom") as! String
        self.timeTo = aDecoder.decodeObject(forKey: "timeTo") as! String
    }
    
    override init() {
        
    }
    
}
