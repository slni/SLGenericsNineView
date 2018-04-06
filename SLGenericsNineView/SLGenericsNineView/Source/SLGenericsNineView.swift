//
//  SLGenericsNineView
//  SLGenericsNineView
//
//  Created by 一声雷 on 2017/8/28.
//  Copyright © 2017年 che300. All rights reserved.
//

import UIKit

public class SLGenericsNineView<ItemView:UIView, ItemModel>: UIView {
    /// cell是否从xib中加载的
    public var isCellLoadFromXib = false
    /// 数据源
    public var dataArr:[ItemModel]?{
        didSet{
            self.reloadData()
        }
    }
    /// 刷新列表数据
    public func reloadData(){
        if dataArr?.count == self.subviews.count{
            // 1.只是进行子控件的数据更新
            for (i , subView) in self.subviews.enumerated(){
                if let view = subView as? ItemView, let model = dataArr?[i]{
                    self.map(view, model)
                }
            }
        }else{
            // 2.删除原先的子控件,进行重新布局
            creatAllItems()
        }
    }
    /// 每个cell点击以后的回调闭包
    public var itemClicked:((_ itemView:ItemView, _ model:ItemModel, _ index:Int)->Void)?
    /*
    1:若使用frame布局,只需确定位置即可,尺寸自动计算.
    2:若使用autolayout布局:只需确定位置即可,尺寸自动计算.
    */
    /// - Parameters:
    ///   - totalWidth: 控件的width
    ///   - map:映射函数,控件和模型直接的数据赋值关系
    public init(totalWidth: CGFloat, map:@escaping (_ cell:ItemView, _ itemModel:ItemModel)->Void) {
        self.totalWidth = totalWidth
        self.map = map
        super.init(frame: CGRect(x: 0, y: 0, width: totalWidth, height: 0))
        self.backgroundColor = UIColor.gray
    }
    /// 上边距
    public var topMargin:CGFloat    = 0
    /// 左边距
    public var leftMargin:CGFloat   = 0
    /// 右边距
    public var rightMargin:CGFloat  = 0
    /// 下边距
    public var bottomMargin:CGFloat = 0
    /// 设置边距
    public func set(edges:CGFloat){
        self.topMargin    = edges
        self.bottomMargin = edges
        self.leftMargin   = edges
        self.rightMargin  = edges
    }
    /// 水平间距
    public var horizontalSpace:CGFloat = 1
    /// 垂直间距
    public var verticalSpace:CGFloat   = 1
    /// 每行展示的个数
    public var everyRowCount:Int = 3
    /// cell高度
    public var itemHeight:CGFloat = 80
    /// cell宽度
    public var itemWidth:CGFloat{
        get{
            let everyRowBtnsWidth = totalWidth - CGFloat(everyRowCount-1)*horizontalSpace - leftMargin - rightMargin
            return everyRowBtnsWidth/CGFloat(everyRowCount)
        }
    }
    /// 整体宽度
    public var totalWidth:CGFloat
    /// 整体高度
    public var totalHeight:CGFloat{
        guard let count = dataArr?.count else{
            return self.frame.height
        }
        var rowCount = 0
        if count % everyRowCount == 0{
            rowCount = count / everyRowCount
        }else{
            rowCount = count / everyRowCount + 1
        }
        let height = itemHeight*CGFloat(rowCount) + verticalSpace*CGFloat(rowCount-1) + topMargin + bottomMargin
        return height
    }
    
    private var map:((_ cell:ItemView, _ itemModel:ItemModel)->Void)
    
    private func initCell() -> ItemView{
        if isCellLoadFromXib{
            let view = Bundle.main.loadNibNamed(ItemView.nameOfClass, owner: nil, options: nil)?.last as! ItemView
            return view
        }else{
            return ItemView.init()
        }
    }
    
    private func creatAllItems(){
        guard let data = self.dataArr else{
            self.removeAllSubviews()
            return
        }
        self.removeAllSubviews()
        for ( i, data ) in data.enumerated(){
            let itemX = i % everyRowCount     //  处于第几列
            let itemY = i / everyRowCount     //  处于第几行
            let btn = self.initCell()
            btn.tag = i
            let x = CGFloat(itemX)*horizontalSpace + CGFloat(itemX)*itemWidth + leftMargin
            let y = CGFloat(itemY)*verticalSpace + CGFloat(itemY)*itemHeight + topMargin
            btn.frame = CGRect(x: x, y: y, width: self.itemWidth, height: self.itemHeight)
            self.addSubview(btn)
            self.map(btn, data)
            // 添加点击手势
            let tap = UITapGestureRecognizer(target: self, action:#selector(SLGenericsNineView.cellClicked(_:)))
            tap.numberOfTouchesRequired = 1
            tap.numberOfTapsRequired    = 1
            btn.addGestureRecognizer(tap)
        }
        // 更新自身高度
        let size = CGSize(width: self.totalWidth, height: self.totalHeight)
        self.frame.size = size
        // 通知控件固有尺寸变化
        self.invalidateIntrinsicContentSize()
    }
    // 手势的点击事件
    @objc func cellClicked(_ tap:UITapGestureRecognizer){
        if let cell = tap.view as? ItemView, let data = self.dataArr?[cell.tag]{
            self.itemClicked?(cell, data, cell.tag)
        }
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 控件固有尺寸
    public override var intrinsicContentSize: CGSize{
        return CGSize(width: totalWidth, height: totalHeight)
    }
}







