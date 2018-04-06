
<img src="https://github.com/slni/SLGenericsNineView/blob/master/sreen.png?raw=true" alt="SLGenericsNineView" title="SLGenericsNineView"/>

### Requirements：
* iOS 8.0+
* Xcode 9.0+
* Swift 4.0+

### Installation：
<details>
<summary>CocoaPods</summary>
</br>
<p>To integrate SLGenericsNineView into your Xcode project using <a href="http://cocoapods.org">CocoaPods</a>, specify it in your <code>Podfile</code>:</p>

<h4>- Integrate:</h4>
<pre><code class="ruby language-ruby">pod 'SLGenericsNineView'</code></pre>

</details>

<details>
<summary>Carthage</summary>
<h4>waiting...</h4>
</details>


### Usage
> 通过泛型的思想完成九宫格布局，所有边距，大小可自定义。可传入自定义的view，自定义的model。通过map函数完成view和model的值对应关系。
> ##只需要确定控件的位置, 其内容尺寸会自动计算, 和UILabel类似。

### 1.通过frame布局

```
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
    
}

```


### 2.支持autolayout布局

```
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
        self.view.addSubview(demoView)
        demoView.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
        }
        demoView.dataArr = arr
    }

}

```

### 3.支持子控件xib加载
```
//CustomXibView
var demoView:SLGenericsNineView<CustomXibView,Person>!
demoView = SLGenericsNineView(totalWidth: self.view.frame.width, map: { (view, model) in
            view.nameLabel.text = model.name
            view.countLabel.text = model.count
})
demoView.frame.origin = CGPoint(x: 0, y: 100)
// 声明子控件从xib中加载
demoView.isCellLoadFromXib = true
self.view.addSubview(demoView)
demoView.dataArr = arr
```

### 4.其他方法
* 修改每行显示的个数

```
demoView.everyRowCount = 2
demoView.reLayoutSubViews()

```

* 刷新数据

```
demoView.reloadData()
```

* 点击事件监听

```
demoView.itemClicked = {(view, model, index) in 
      debugPrint(index)
      debugPrint(view)
      debugPrint(model)
}
```

* 修改边距

```
/// 上边距
public var topMargin:CGFloat    
/// 左边距
public var leftMargin:CGFloat   
/// 右边距
public var rightMargin:CGFloat  
/// 下边距
public var bottomMargin:CGFloat 
/// 设置边距
public func set(edges:CGFloat)
/// 水平间距
public var horizontalSpace:CGFloat 
/// 垂直间距
public var verticalSpace:CGFloat   
```

<img src="https://github.com/slni/SLGenericsNineView/blob/master/demoPic.png?raw=true" alt="SLGenericsNineView" title="SLGenericsNineView" width="557"/>


