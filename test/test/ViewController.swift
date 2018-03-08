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

    var demoView:SLGenericsNineView<CustomView,CustomModel>!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建的时候一定要告诉view的宽度
        let frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 0)
        demoView = SLGenericsNineView(frame: frame, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
        })
        demoView.backgroundColor = UIColor.red
        // 上下左右的间距，默认为0
        demoView.topMargin = 2
        demoView.leftMargin = 4
        demoView.rightMargin = 6
        demoView.bottomMargin = 8
        // 行间距，列间距
        demoView.verticalSpace = 10
        demoView.horizontalSpace = 10
        // 每行显示的个数
        demoView.everyRowCount = 3
        self.view.addSubview(demoView)
        // 设置数据源
        let m1 = CustomModel(name: "张三", count: "1")
        let m2 = CustomModel(name: "李四", count: "2")
        let m3 = CustomModel(name: "王五", count: "3")
        let m4 = CustomModel(name: "James", count: "4")
        let m5 = CustomModel(name: "san", count: "5")
        let m6 = CustomModel(name: "slni", count: "6")
        let m7 = CustomModel(name: "Kevin", count: "7")
        let arr = [m1, m2, m3, m4, m5, m6, m7]
        demoView.dataArr = arr
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

