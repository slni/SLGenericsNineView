//
//  CustomXibView.swift
//  demo
//
//  Created by 倪申雷 on 2018/4/4.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit

class CustomXibView: UIView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.red
    }
    
}
