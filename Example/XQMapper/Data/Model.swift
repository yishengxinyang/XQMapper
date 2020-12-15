//
//  Model.swift
//  TestDemo
//
//  Created by 谢祥清 on 2020/12/11.
//  Copyright © 2020 com.ecpark. All rights reserved.
//

import UIKit
import XQMapper

class Model: Mappble {
    var school:String?
    var student:Int?
    var name:String?
    var other:String?
    var list:[TestModel1]?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        school = map["test_school"]
        student = map["student_test"]
        name = map["name"]
        list = map["list"]
        other = map["test_val"]
    }
    
    var description:String{
        return "school is:" + "\(school ?? "")\n" + "name is: + \(name ?? "无名氏")\n" + "student is: \(student ?? 0)\n"
    }
}
