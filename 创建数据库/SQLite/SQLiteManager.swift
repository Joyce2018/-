


//
//  SQLiteManager.swift
//  创建数据库
//
//  Created by YYY on 2017/11/20.
//  Copyright © 2017年 成品家（北京）网路科技有限公司. All rights reserved.
//
//INSERT OR REPLACE INTO status(statusID, userID, Text) VALUES(2000, 1010, "happy");

import Foundation
import FMDB

//数据库是保存在沙盒的一个文件，需要先创建和打开数据库
//FMDB的内部队列是串行队列，同步执行。可以保证同一时间，只有一个任务操作数据库，从而保证数据库的读写安全。
//只有在创建表的时候，使用执行多条语句，可以创建多个表
//增删改查，不使用执行多条语句

class SQLiteManager
{
    //队列
    let queue: FMDatabaseQueue
    
    //创建单例
    static let shared = SQLiteManager()
    
    private init()
    {
        let dbName = "status.db"
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        path = (path as NSString).appendingPathComponent(dbName)
        //创建数据库队列
        queue = FMDatabaseQueue(path: path)
        
        //创建表
        createTable()
    }
}

//创建表
private extension SQLiteManager
{
    //创建表
    func createTable()
    {
        guard let path = Bundle.main.path(forResource: "sina.sql", ofType: nil),
            let sql = try? String(contentsOfFile: path) else
        {
            return
        }
        print("数据库路径：\(path)")
        //执行SQL语句
        //只有在创建表的时候，使用执行多条语句，可以创建多个表
        //增删改查，不使用执行多条语句
        queue.inDatabase { (db) in
            if db?.executeStatements(sql) == true
            {
                print("创表成功")
            }
            else
            {
                print("创表失败")
            }
        }
    }
}

//插入表
extension SQLiteManager
{
    func insertTable(userID: String, array: [[String: AnyObject]])
    {
        let sql = "INSERT OR REPLACE INTO weibo(statusID, userID, Text) VALUES(?, ?, ?);"
        queue.inTransaction { (db, roolback) in
            for dict in array
            {
                guard let statusID = dict["idstr"],
                    let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: []) else
                {
                    continue
                }
                if db?.executeUpdate(sql, withArgumentsIn: [statusID, userID, jsonData]) == false
                {
                    //需要回滚
                    roolback?.pointee = true
                    break
                }
                else
                {
                    print("插入成功")
                }
            }
        }
    }
}

//查询表
extension SQLiteManager
{
    func queryTable() -> [[String: Any]]
    {
        var result = [[String: Any]]()
        let sql = "SELECT statusID, userID, Text FROM weibo;"
        queue.inDatabase { (db) in
            //结果集
            guard let resultSet = db?.executeQuery(sql, withArgumentsIn: []) else
            {
                return
            }
            while resultSet.next()
            {
                let columnCount = resultSet.columnCount()
                for i in 0..<columnCount
                {
                    //列名
                    guard let name = resultSet.columnName(for: i),
                          let value = resultSet.object(forColumnIndex: i) else
                    {
                        continue
                    }
     
                    result.append([name: value])
                }
            }
        }
        return result
    }
}

