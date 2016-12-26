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
        }
        
        createTable()
    }
    
    //  创建表
    func createTable() -> Void {
        let sql = "create table  CountInfo(id integer primary key autoincrement,countInfo data)"
        let result = db.executeUpdate(sql, withArgumentsIn: nil)
        if result {
            print("创建表格成功")
        }
    }
    
    //  删除表
    func dropTable() -> Void {
        let sql = "drop table if exists CountInfo"
        let result = db.executeUpdate(sql, withArgumentsIn: nil)
        if result {
            print("删除表格成功")
        }
    }
    
    //  插入数据
    func insertData(data:Data) -> Void {
        let sql = String.init(format: "insert into CountInfo (countInfo) values (%@)", data as CVarArg)
        let result = db.executeUpdate(sql, withArgumentsIn: nil)
        if result {
            print("插入成功")
        }
    }
    
    //  搜索全部
    func quaryData() -> Void {
        
        let sql = "select * from CountInfo"
        let resultSet = db.executeQuery(sql, withArgumentsIn: nil)
        while (resultSet?.next())! {
            let name = resultSet?.string(forColumn: "name")
            let age = resultSet?.int(forColumn: "age")
            let score = resultSet?.double(forColumn: "score")
            
            print(name!)
            print(age!)
            print(score!)
        }
    }
}
