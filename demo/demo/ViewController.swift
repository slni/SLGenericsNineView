//
//  ViewController.swift
//  test
//
//  Created by 倪申雷 on 2018/3/8.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit
import SLGenericsNineView
class ViewController: UIViewController {
    
    var demoView01:SLGenericsNineView<CustomView,CustomModel>!
    var demoView02:SLGenericsNineView<CustomXibView,CustomModel>!
    lazy var data:[CustomModel] = {
        let m1 = CustomModel(name: "张三", count: "1")
        let m2 = CustomModel(name: "李四", count: "2")
        let m3 = CustomModel(name: "王五", count: "3")
        let m4 = CustomModel(name: "James", count: "4")
        let m5 = CustomModel(name: "san", count: "5")
        let m6 = CustomModel(name: "slni", count: "6")
        let m7 = CustomModel(name: "Kevin", count: "7")
        return [m1, m2, m3, m4, m5, m6, m7]
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        initWithCode()
        initWithXib()
    }
    
    func initWithCode(){
        // 创建的时候一定要告诉view的宽度
        let frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: 0)
        demoView01 = SLGenericsNineView(frame: frame, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
        })
        demoView01.backgroundColor = UIColor.red
        // 上下左右的间距，默认为0
        demoView01.set(edges: 20)
        // 行间距，列间距
        demoView01.verticalSpace = 10
        demoView01.horizontalSpace = 10
        // 每行显示的个数
        demoView01.everyRowCount = 3
        demoView01.itemClicked = { (itemView, itemModel, index) in
            print(itemView)
            print(itemModel)
            print(index)
        }
        self.view.addSubview(demoView01)
        // 设置数据源
        demoView01.dataArr = data
    }
    
    func initWithXib(){
        // 创建的时候一定要告诉view的宽度
        let frame = CGRect(x: 0, y: self.view.frame.height/2 + 20, width: self.view.frame.width, height: 0)
        demoView02 = SLGenericsNineView(frame: frame, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
        })
        demoView02.isCellLoadFromXib = true
        demoView02.backgroundColor = UIColor.red
        // 上下左右的间距，默认为0
        demoView02.set(edges: 20)
        // 行间距，列间距
        demoView02.verticalSpace = 10
        demoView02.horizontalSpace = 10
        // 每行显示的个数
        demoView02.everyRowCount = 4
        demoView02.itemClicked = { (itemView, itemModel, index) in
            print(itemView)
            print(itemModel)
            print(index)
        }
        self.view.addSubview(demoView02)
        // 设置数据源
        demoView02.dataArr = data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

