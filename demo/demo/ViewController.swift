//
//  ViewController.swift
//  test
//
//  Created by 倪申雷 on 2018/3/8.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit
import SnapKit
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
//        initWithCode_snapKit()
//        initWithCode()
        initWithXib()
    }
    
    func initWithCode(){
        demoView01 = SLGenericsNineView(totalWidth: self.view.frame.width, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
        })
        demoView01.frame.origin = CGPoint(x: 0, y: 100)
        self.view.addSubview(demoView01)
        demoView01.dataArr = data
    }
    
    func initWithCode_snapKit(){
        demoView01 = SLGenericsNineView(totalWidth: self.view.frame.width, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
        })
        self.view.addSubview(demoView01)
        demoView01.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        demoView01.dataArr = data
    }
    
    func initWithXib(){
        demoView02 = SLGenericsNineView(totalWidth: self.view.frame.width, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
        })
        demoView02.frame.origin = CGPoint(x: 0, y: 100)
        demoView02.isCellLoadFromXib = true
        self.view.addSubview(demoView02)
        demoView02.dataArr = data
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        demoView01.dataArr = [CustomModel(name: "张三", count: "1")]
    }
    
    
}

