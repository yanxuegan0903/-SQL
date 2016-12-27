//
//  CountInfo.swift
//  模仿自动计数
//
//  Created by vsKing on 2016/12/26.
//  Copyright © 2016年 vsKing. All rights reserved.
//

import Foundation

class CountInfo: NSObject, NSCoding {
    
    var id:NSInteger = NSInteger.init()
    var count:Int = Int.init()
    var timeFrom:String = String.init()
    var timeTo:String = String.init()
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(count, forKey: "count")
        aCoder.encode(timeFrom, forKey: "timeFrom")
        aCoder.encode(timeTo, forKey: "timeTo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        self.count = Int(aDecoder.decodeCInt(forKey: "count"))
        self.timeFrom = aDecoder.decodeObject(forKey: "timeFrom") as! String
        self.timeTo = aDecoder.decodeObject(forKey: "timeTo") as! String
        
    }
    
    init(count:Int,timeFrom:String,timeTo:String) {
        
        super.init()
        
        self.count = count
        self.timeTo = timeTo
        self.timeFrom = timeFrom
    }
    
    override init() {
        
    }
    
}
