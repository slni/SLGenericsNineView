//
//  FrameViewController.swift
//  demo
//
//  Created by 倪申雷 on 2018/4/6.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit
import SLGenericsNineView
class FrameViewController: UIViewController {

    var demoView:SLGenericsNineView<CustomView,Person>!
    lazy var arr:[Person] = {
        return Person.getDataArr()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initSubviews()
        // btn1
        let btn1 = UIButton()
        btn1.setTitle("刷新数据", for: .normal)
        btn1.backgroundColor = UIColor.red
        btn1.addTarget(self, action: #selector(loadNewData), for: .touchUpInside)
        self.view.addSubview(btn1)
        btn1.snp.makeConstraints { (make) in
            make.top.equalTo(demoView.snp.bottom)
            make.left.equalTo(self.view)
        }
        // btn2
        let btn2 = UIButton()
        btn2.setTitle("每行5个数", for: .normal)
        btn2.backgroundColor = UIColor.red
        btn2.addTarget(self, action: #selector(rowCountChanged5), for: .touchUpInside)
        self.view.addSubview(btn2)
        btn2.snp.makeConstraints { (make) in
            make.top.equalTo(demoView.snp.bottom)
            make.right.equalTo(self.view)
        }
        // btn3
        let btn3 = UIButton()
        btn3.setTitle("每行2个数", for: .normal)
        btn3.backgroundColor = UIColor.red
        btn3.addTarget(self, action: #selector(rowCountChanged2), for: .touchUpInside)
        self.view.addSubview(btn3)
        btn3.snp.makeConstraints { (make) in
            make.top.equalTo(demoView.snp.bottom)
            make.centerX.equalTo(demoView)
        }
    }
    
    func initSubviews(){
        demoView = SLGenericsNineView(totalWidth: self.view.frame.width, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
        })
        demoView.frame.origin = CGPoint(x: 0, y: 100)
        self.view.addSubview(demoView)
        demoView.dataArr = arr
    }
    
    // 刷新数据
    @objc func loadNewData(){
        demoView.dataArr = Person.getNewDataArr()
    }
    // 改变每行个数
    @objc func rowCountChanged5(){
        demoView.everyRowCount = 5
        demoView.reLayoutSubViews()
    }
    // 改变每行个数
    @objc func rowCountChanged2(){
        demoView.everyRowCount = 2
        demoView.reLayoutSubViews()
    }

}
