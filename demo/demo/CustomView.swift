//
//  CustomView.swift
//  test
//
//  Created by 倪申雷 on 2018/3/8.
//  Copyright © 2018年 倪申雷. All rights reserved.
//

import UIKit

class CustomView: UIView {

    var nameLabel:UILabel!
    var countLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
        nameLabel = UILabel()
        nameLabel.textAlignment = .center
        self.addSubview(nameLabel)
        countLabel = UILabel()
        countLabel.textAlignment = .center
        self.addSubview(countLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/2)
        countLabel.frame = CGRect(x: 0, y: self.frame.height/2, width: self.frame.width, height: self.frame.height/2)
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
