//
//  ViewController.swift
//  test
//
//  Created by 倪申雷 on 2018/3/8.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var arr = ["frame布局", "autolayout布局","支持xib加载"]
    lazy var tableview:UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页"
        tableview.frame = self.view.frame
        self.view.addSubview(tableview)
    }
    
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        cell?.textLabel?.text = arr[indexPath.row]
        return cell!
    }
    
}

extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title = arr[indexPath.row]
        switch indexPath.row {
        case 0:
            let vc = FrameViewController()
            vc.title = title
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = AutolayoutViewController()
            vc.title = title
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = XibloadViewController()
            vc.title = title
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}





