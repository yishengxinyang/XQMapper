//
//  TestModel1.swift
//  TestDemo
//
//  Created by 谢祥清 on 2020/12/11.
//  Copyright © 2020 com.ecpark. All rights reserved.
//

import UIKit
import XQMapper

class TestModel1:Mappble{
    var name:String?
    var age:Int?
    
    required init?(_ map: Map) {}
    
    func mapping(map: Map) {
        name = map["name"]
        age = map["age"]
    }
    

    var description:String{
        return "一个年龄为\(age ?? 0), 姓名为\(name ?? "")的学生"
    }
    
}
