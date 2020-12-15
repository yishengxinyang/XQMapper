//
//  HomeController.swift
//  TestDemo
//
//  Created by 谢祥清 on 2020/12/7.
//  Copyright © 2020 com.ecpark. All rights reserved.
//

import UIKit
import XQMapper

class HomeController: UITableViewController {
    var testItem : [String] = ["json数组转模型","json字符串转模型","json字典转模型","json字典、数组组合转模型","json、数组组合转模型","json组合字段取值"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Table view data source
extension HomeController{
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "HomeController"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: identifier)
        cell.selectionStyle = .none
        cell.textLabel?.text = testItem[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 20))
//        view.backgroundColor = UIColor.purple
//        return view
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0,0): jsonArrayToModel()
        case (0,1): jsonStringToModel()
        case (0,2): jsonToModel()
        case (0,3): jsonArrayCombineToModel()
        case (0,4): arrayJsonCombineToModel()
        case (0,5): chainFiledValue()
        default:print("didSelectRowAt = \(indexPath.row)")
        }
    }
}

extension HomeController{
    func jsonArrayToModel(){
        let list = [["age":12,"name":"name1"],["age":15,"name":"name2"],["age":18,"name":"name3"]]
        let models = Mapper<TestModel1>().map(array: list)
        if let modelList = models{
            for index in 0..<modelList.count{
                print("json array to model list item\(index) = \n \(modelList[index].description)")
            }
        }
    }
    
    func jsonStringToModel(){
        let json = ["age":22,"name":"无名氏"] as [String : Any]
        if let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted), let jsonStr = String.init(data: jsonData, encoding: .utf8){
            let model = Mapper<TestModel1>().map(JSONString: jsonStr)
            print("json string to model \n info:\(model?.description ?? "")")
        }
        
    }
    
    func jsonToModel(){
        let json = ["age":30,"name":"无名氏"] as [String : Any]
        let model = Mapper<TestModel1>().map(json: json)
        print("json to model \n info:\(model?.description ?? "")")
    }
    
    func jsonArrayCombineToModel(){
        let list = [["age":22,"name":"name1"],["age":25,"name":"name2"],["age":28,"name":"name3"]]
        let json : [String:Any] = ["student_test":40,"test_school":"初级中学","name":"大塘中学","list":list]
                
        let model = Mapper<Model>().map(json: json)
        print("json Array Combine To Model \n info: \(model?.description ?? "")")
        
    }

    func arrayJsonCombineToModel(){
        let list1 = [["age":12,"name":"name1"],["age":15,"name":"name2"],["age":18,"name":"name3"]]
        let json1 : [String:Any] = ["student_test":23,"test_school":"初级小学","name":"大塘小学","list":list1]
        
        let list2 = [["age":22,"name":"name1"],["age":25,"name":"name2"],["age":28,"name":"name3"]]
        let json2 : [String:Any] = ["student_test":40,"test_school":"初级中学","name":"大塘中学","list":list2]
        
        let list = [json1,json2]
        
        let models = Mapper<Model>().map(array: list)
        
        if let modelList = models{
            for index in 0..<modelList.count{
                print("json array to model list item\(index) = \n\(modelList[index].description)")
            }
        }
    }
    
    func chainFiledValue(){
        let json : [String:Any] = ["age":25, "school":"华南师范大学","name":"1212", "result":["text":"测试"],
                                   "test":["intVal":20,"number":["floatVal":20,"isValid":true],"list":[["age":22,"name":"mingzi"],["age":24,"name":"xxq"]]],
                                   "json":["age":22,"name":"mingzi"]]
        let model = Mapper<TestModel>().map(json: json)
        print("model info:\n\(model?.description ?? "")")
    }
}
