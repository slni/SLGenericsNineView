//
//  CustomModel.swift
//  test
//
//  Created by 倪申雷 on 2018/3/8.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit

class Person {
    var name:String?
    var count:String?
    
    init(name:String?,count:String?) {
        self.name = name
        self.count = count
    }
    
    static func getDataArr() -> [Person]{
        let m1 = Person(name: "Ben", count: "1")
        let m2 = Person(name: "Susan", count: "2")
        let m3 = Person(name: "Kevin", count: "3")
        let m4 = Person(name: "James", count: "4")
        let m5 = Person(name: "san", count: "5")
        let m6 = Person(name: "slni", count: "6")
        let m7 = Person(name: "Kevin", count: "7")
        return [m1, m2, m3, m4, m5, m6, m7]
    }
    
    static func getNewDataArr() -> [Person]{
        let m1 = Person(name: "张三", count: "19岁")
        let m2 = Person(name: "李四", count: "20岁")
        let m3 = Person(name: "王五", count: "26岁")
        let m4 = Person(name: "倪六", count: "32岁")
        let m5 = Person(name: "王二", count: "19岁")
        let m6 = Person(name: "李冰", count: "29岁")
        let m7 = Person(name: "孙八", count: "23岁")
        let m8 = Person(name: "陈好", count: "41岁")
        return [m1, m2, m3, m4, m5, m6, m7, m8]
    }

}
