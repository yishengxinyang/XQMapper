//
//  Mappble.swift
//  TestDemo
//
//  Created by 谢祥清 on 2020/12/15.
//  Copyright © 2020 com.ecpark. All rights reserved.
//

import UIKit

//json转模型、字符串转模型、json转数组
public protocol BaseMappble{//1.定义协议，协议中包含映射关系
    mutating func mapping(map: Map)
}

public protocol Mappble: BaseMappble{
    init?(_ map:Map)
}


public extension Mappble{
    /// Initializes object from a JSON Dictionary
    init?(json: [String: Any], context: MapContext? = nil) {
        if let obj: Self = Mapper(context: context).map(json: json) {
            self = obj
        } else {
            return nil
        }
    }
    
    init?(JSONString:String, context:MapContext? = nil) {
        if let obj : Self = Mapper(context: context).map(JSONString: JSONString){
            self = obj
        }else{
            return nil
        }
    }
}
