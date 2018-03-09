//
//  UIViewExt.swift
//  SLUIKit
//
//  Created by 一声雷 on 2018/3/6.
//  Copyright © 2018年 slni. All rights reserved.
//

import UIKit

extension UIView{
    // 移除所有的子控件
    func removeAllSubviews(){
        while (self.subviews.count > 0){
            self.subviews.last?.removeFromSuperview()
        }
    }
    
}































