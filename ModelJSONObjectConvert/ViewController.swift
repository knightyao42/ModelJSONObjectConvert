//
//  ViewController.swift
//  ModelJSONObjectConvert
//
//  Created by knightyao on 2018/5/4.
//  Copyright © 2018年 knightyao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        codableTest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    func codableTest() {
        let std = Student(name: "aaa", age: 11, height: 120, teacher: Teacher(name: "bbb", age: 30, role: .teacher), role: .student)
        let dict = std.toDictionary
        guard let jsonStr = std.toJsonStr else {return}
        guard let jsonData = std.toJsonData else {return}
        print(jsonStr, dict, jsonData)
        print("========================================")
        let str = "{\"age\":11,\"role\":0,\"name\":\"aaa\",\"height\":120,\"teacher\":{\"name\":\"bbb\",\"age\":30,\"role\":1}}"
        let data = str.data(using: .utf8)!
        
        if let std2 = Student.getModel(data: data) {
            print(std2)
        }
        print("========================================")
        if let std3 = Student.getModel(jsonStr: str) {
            print(std3)
        }
        print("========================================")
        let parent = Parent(name: "jack", age: 30, role: .parent)
        parent.log()
    }
}
