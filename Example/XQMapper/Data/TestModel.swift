//
//  TestModel.swift
//  TestDemo
//
//  Created by 谢祥清 on 2020/12/7.
//  Copyright © 2020 com.ecpark. All rights reserved.
//

import UIKit
import XQMapper

class TestModel: Mappble{
    var name : String?
    var age : Int?
    var school : String?
    var text : String?
    var intVal:Int?
    var floatVal:Int?
    var isValid:Bool?
    var json:TestModel1?
    var list:[TestModel1]?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        name = map["name"]
        age = map["age"]
        school = map["school"]
        text = map["result.text"]
        intVal = map["test.intVal"]
        floatVal = map["test.number.floatVal"]
        isValid = map["test.number.isValid"]
        json = map["json"]
        list = map["test.list"]
    }

    
    var description:String{
        return "name = \(name ?? ""), age = \(age ?? 0), school = \(school ?? "")"
    }
    
}
