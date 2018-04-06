//
//  XibloadViewController.swift
//  demo
//
//  Created by 倪申雷 on 2018/4/6.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit
import SLGenericsNineView
class XibloadViewController: UIViewController {

    var demoView:SLGenericsNineView<CustomXibView,Person>!
    lazy var arr:[Person] = {
        return Person.getDataArr()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        initSubviews()
    }
    
    func initSubviews(){
        demoView = SLGenericsNineView(totalWidth: self.view.frame.width, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
        })
        demoView.itemClicked = {(view, model, index) in 
            debugPrint(index)
            debugPrint(view)
            debugPrint(model)
        }
        demoView.frame.origin = CGPoint(x: 0, y: 100)
        demoView.isCellLoadFromXib = true
        self.view.addSubview(demoView)
        demoView.dataArr = arr
    }

}
