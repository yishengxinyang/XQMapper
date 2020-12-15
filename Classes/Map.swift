//
//  Map.swift
//  TestDemo
//
//  Created by 谢祥清 on 2020/12/15.
//  Copyright © 2020 com.ecpark. All rights reserved.
//

import UIKit


//映射实体(保存JSON实体)
public final class Map:NSObject{
    var json:[String:Any] = [:]
    var currentKey : String?
    var currentValue : Any?
    
    public enum DataType{
        case Float, Int, String, Long, Bool
    }
    
    public init(json:[String:Any]){
        self.json = json
    }
    
    public init(JSONString:String){
        if let json = Map.parseJSONString(JSONString) as? [String:Any]{
            self.json = json
        }
    }

    
    public class func parseJSONString(_ JSONString:String) -> Any?{
        guard let data = JSONString.data(using: .utf8) else{return nil}
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else{return nil}
        return obj
    }
}

extension Map{
    public subscript(key:String) -> Float?{
        guard !key.isEmpty else{return nil}
        //keys
        let keys = NSString.init(string: key).components(separatedBy: ".")

        guard !keys.isEmpty else{return nil}
        if keys.count == 1{
            let val = json[key] as? Float
            return val
        }else{
            var index = 0
            var curJson:[String:Any] = self.json
            var val : Float?
            while index < keys.count {
                let curKey = keys[index]
                if index < (keys.count - 1){
                    if let curVal = curJson[curKey] as? [String:Any]{
                        curJson = curVal
                    }else{
                        break
                    }
                }else{
                    val = curJson[curKey] as? Float
                }
                index = index + 1
            }
            return val
        }
    }
    
    public subscript(key:String) -> Int?{
        guard !key.isEmpty else{return nil}
        //keys
        let keys = NSString.init(string: key).components(separatedBy: ".")

        guard !keys.isEmpty else{return nil}
        if keys.count == 1{
            let val = json[key] as? Int
            return val
        }else{
            var index = 0
            var curJson:[String:Any] = self.json
            var val : Int?
            while index < keys.count {
                let curKey = keys[index]
                if index < (keys.count - 1){
                    if let curVal = curJson[curKey] as? [String:Any]{
                        curJson = curVal
                    }else{
                        break
                    }
                }else{
                    val = curJson[curKey] as? Int
                }
                index = index + 1
            }
            return val
        }
    }

    
    public subscript(key:String) -> String?{
        guard !key.isEmpty else{return nil}

        //keys
        let keys = NSString.init(string: key).components(separatedBy: ".")

        guard !keys.isEmpty else{return nil}
        
        if keys.count == 1{
            let val = json[key] as? String
            return val
        }else{
            var index = 0
            var curJson:[String:Any] = self.json
            var val:String?
            while index < keys.count {
                let curKey = keys[index]
                if index < (keys.count - 1){
                    if let curVal = curJson[curKey] as? [String:Any]{
                        curJson = curVal
                    }else{
                        break
                    }
                }else{
                    val = curJson[curKey] as? String
                }
                index = index + 1
            }
            return val
        }
    }
    
    public subscript(key:String) -> Bool?{
        guard !key.isEmpty else{return nil}

        //keys
        let keys = NSString.init(string: key).components(separatedBy: ".")

        guard !keys.isEmpty else{return nil}
        
        if keys.count == 1{
            let val = json[key] as? Bool
            return val
        }else{
            var index = 0
            var curJson:[String:Any] = self.json
            var val:Bool?
            while index < keys.count {
                let curKey = keys[index]
                if index < (keys.count - 1){
                    if let curVal = curJson[curKey] as? [String:Any]{
                        curJson = curVal
                    }else{
                        break
                    }
                }else{
                    val = curJson[curKey] as? Bool
                }
                index = index + 1
            }
            return val
        }
    }
    
    public subscript<T:Mappble>(key:String) -> T?{
        guard !key.isEmpty else{return nil}

        //keys
        let keys = NSString.init(string: key).components(separatedBy: ".")

        guard !keys.isEmpty else{return nil}
        
        if keys.count == 1{
            if let val = json[key] as? [String:Any]{
                return Mapper<T>().map(json: val)
            }
        }else{
            var index = 0
            var curJson:[String:Any] = self.json
            var val:T?
            while index < keys.count {
                let curKey = keys[index]
                if index < (keys.count - 1){
                    if let curVal = curJson[curKey] as? [String:Any]{
                        curJson = curVal
                    }else{
                        break
                    }
                }else{
                    if let jsonVal = curJson[curKey] as? [String:Any]{
                        val = Mapper<T>().map(json: jsonVal)
                    }
                }
                index = index + 1
            }
            return val
        }
        
        return nil
    }
    
    public subscript<T:Mappble>(key:String) -> [T]?{
        guard !key.isEmpty else{return nil}
        //keys
        let keys = NSString.init(string: key).components(separatedBy: ".")
        guard !keys.isEmpty else{return nil}
        
        if keys.count == 1{
            if let val = json[key] as? [Any]{
                return Mapper<T>().map(array: val)
            }
        }else{
            var index = 0
            var curJson:[String:Any] = self.json
            var val:[T]?
            while index < keys.count {
                let curKey = keys[index]
                if index < (keys.count - 1){
                    if let curVal = curJson[curKey] as? [String:Any]{
                        curJson = curVal
                    }else{
                        break
                    }
                }else{
                    if let list = curJson[curKey] as? [Any]{
                        val = Mapper<T>().map(array: list)
                    }
                }
                index = index + 1
            }
            return val
        }
        return nil
    }
}
