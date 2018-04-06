//
//  AutolayoutViewController.swift
//  demo
//
//  Created by 倪申雷 on 2018/4/6.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit
import SnapKit
import SLGenericsNineView
class AutolayoutViewController: UIViewController {

    var demoView:SLGenericsNineView<CustomView,Person>!
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
        self.view.addSubview(demoView)
        demoView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        demoView.dataArr = arr
    }

}
