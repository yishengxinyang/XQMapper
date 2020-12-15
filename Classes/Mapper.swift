//
//  Mapper.swift
//  TestDemo
//
//  Created by 谢祥清 on 2020/12/15.
//  Copyright © 2020 com.ecpark. All rights reserved.
//

import UIKit

//映射工具
public final class Mapper<T:BaseMappble>{//映射器，负责将json、json字符串等转换成模型（模型属性初始化，或者通过构造器进行初始化）
    var context:MapContext?
    public init(context:MapContext? = nil) {
        self.context = context
    }
    
    public func map(json:[String:Any]) -> T?{
        let map = Map.init(json: json)

        if let klass = T.self as? Mappble.Type { // Check if object is Mappable
            if var object = klass.init(map) as? T{
                object.mapping(map: map)
                return object
            }
        }
        return nil
    }
    
    public func map(JSONString:String) -> T?{
        let map = Map.init(JSONString: JSONString)
        if let klass = T.self as? Mappble.Type{
            if var object = klass.init(map) as? T{
                object.mapping(map: map)
                return object
            }
        }
        return nil
    }
    
    public func map(array:[Any]) -> [T]?{
        guard !array.isEmpty else{return nil}
        var list = [T]()
        for item in array{
            guard let json = item as? [String:Any] else {continue}
            if let val = Mapper<T>().map(json: json){
                list.append(val)
            }
        }
        return list
    }
}

public protocol MapContext{}

