//
//  SQLiteManager.swift
//  模仿自动计数
//
//  Created by vsKing on 2016/12/26.
//  Copyright © 2016年 vsKing. All rights reserved.
//

import Foundation


class SQLiteManager: NSObject {
    
    //  单例 
    static let shareInstance = SQLiteManager()
  
    
    lazy var db:FMDatabase = {
        
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        //写上自己的数据库名称及路径
        let path = documentsFolder.appending("/countInfo.sqlite")
        //新建数据库
        let database = FMDatabase.init(path: path)
        
        return database!
    
    }()
    
    //实例化db对象的时候就会默认打开或创建一个数据库
    override init() {
        super.init()
        
        if db.open(){
            print("打开数据库成功")
        }else {
            print("打开数据库失败")
        }
        
        createTable()
    }
    
    //  创建表
    func createTable() -> Void {
        let sql = "create table IF NOT EXISTS CountInfo(id integer primary key autoincrement, count int, timeFrom string, timeTo string)"
        let result = db.executeUpdate(sql, withArgumentsIn: nil)
        if result {
            print("创建表格成功")
        }else {
            print("创建表格失败")
        }
    }
    
    //  删除表
    func dropTable() -> Void {
        let sql = "drop table if exists CountInfo"
        let result = db.executeUpdate(sql, withArgumentsIn: nil)
        if result {
            print("删除表格成功")
        }else {
            print("删除表格失败")
        }
    }
    
    //  插入数据
    func insertData(countInfo:CountInfo) -> Void {
        let sql = String.init(format: "insert into CountInfo (count,timeFrom,timeTo) values (%d,%@,%@)",countInfo.count,countInfo.timeFrom,countInfo.timeTo)
        
        print("插入 SQL = ",sql)
        
        let result = db.executeUpdate(sql, withArgumentsIn: nil)
        if result {
            print("插入数据成功")
        }else {
            print("插入数据失败")
        }
    }
    
    //  搜索全部
    func quaryData() -> NSMutableArray {
        
        let sql = "select * from CountInfo"
        let resultSet = db.executeQuery(sql, withArgumentsIn: nil)
        
        let countArray:NSMutableArray = NSMutableArray.init()
        
        while (resultSet?.next())! {
            
            let id = resultSet?.int(forColumn: "id")
            let count = resultSet?.int(forColumn: "count")
            let timeFrom:String = (resultSet?.string(forColumn: "timeFrom"))!
            let timeTo:String = (resultSet?.string(forColumn: "timeTo"))!
            
            let countInfo:CountInfo = CountInfo()
            countInfo.id = NSInteger.init(id!)
            countInfo.count = Int.init(count!)
            countInfo.timeFrom = timeFrom
            countInfo.timeTo = timeTo
            
            countArray.add(countInfo)

        }
        
        return countArray
        
    }
}
