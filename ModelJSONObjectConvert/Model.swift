//
//  Model.swift
//  ModelJSONObjectConvert
//
//  Created by knightyao on 2018/5/4.
//  Copyright © 2018年 knightyao. All rights reserved.
//

import Foundation

enum UserRoleType: Int, Codable {
    case student = 0
    case teacher = 1
    case parent = 2
}

struct Teacher: Codable {
    let name: String?
    let age: Int?
    let role: UserRoleType?
}

struct Student: Codable {
    let name: String?
    let age: Int?
    let height: Double?
    let teacher: Teacher?
    let role: UserRoleType?
}

class Parent: Codable {
    var name: String?
    var age: Int?
    var role: UserRoleType?
    
    
    init(name: String, age: Int, role: UserRoleType) {
        self.name = name
        self.age = age
        self.role = role
    }
    
    func log() {
        print(name ?? 0, age ?? 0, role ?? .parent)
    }
}
