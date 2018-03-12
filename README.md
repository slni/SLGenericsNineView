# SLGenericsNineView

<img src="https://github.com/slni/SLGenericsNineView/blob/master/sreen.png?raw=true" alt="SLGenericsNineView" title="SLGenericsNineView"/>

### Requirements：
* iOS 8.0+
* Xcode 9.0+
* Swift 4.0+

### Installation：
<details>
<summary>CocoaPods</summary>
</br>
<p>To integrate SwifterSwift into your Xcode project using <a href="http://cocoapods.org">CocoaPods</a>, specify it in your <code>Podfile</code>:</p>

<h4>- Integrate:</h4>
<pre><code class="ruby language-ruby">pod 'SLGenericsNineView'</code></pre>

</details>

<details>
<summary>Carthage</summary>
<h4>waiting...</h4>
</details>


### Usage
> 通过泛型的思想完成九宫格布局，所有边距，大小可自定义。可传入自定义的view，自定义的model。通过map函数完成view和model的值对应关系。


<img src="https://github.com/slni/SLGenericsNineView/blob/master/demoPic.png?raw=true" alt="SLGenericsNineView" title="SLGenericsNineView" width="557"/>


```
import SLGenericsNineView
var demoView:SLGenericsNineView<CustomView,CustomModel>!
override func viewDidLoad() {
	super.viewDidLoad()
	// 创建的时候一定要告诉view的宽度
	let frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 0)
	demoView = SLGenericsNineView(frame: frame, map: { (view, model) in
	    // 关联赋值关系
	    view.nameLabel.text = model.name
	    view.countLabel.text = model.count
	})
	demoView.backgroundColor = UIColor.red
	// 上下左右的间距，默认为0
	demoView.topMargin = 2
	demoView.leftMargin = 4
	demoView.rightMargin = 6
	demoView.bottomMargin = 8
	// 行间距，列间距
	demoView.verticalSpace = 10
	demoView.horizontalSpace = 10
	// 每行显示的个数
	demoView.everyRowCount = 3
	self.view.addSubview(demoView)
	// 设置数据源
	let m1 = CustomModel(name: "张三", count: "1")
	let m2 = CustomModel(name: "李四", count: "2")
	let m3 = CustomModel(name: "王五", count: "3")
	let m4 = CustomModel(name: "James", count: "4")
	let m5 = CustomModel(name: "san", count: "5")
	let m6 = CustomModel(name: "slni", count: "6")
	let m7 = CustomModel(name: "Kevin", count: "7")
	let arr = [m1, m2, m3, m4, m5, m6, m7]
	demoView.dataArr = arr
	
	// 数据刷新(数据变化)
	demoView.reloadData()	    
}
```

```
// 获取具体cell的点击回调
demoView.itemClicked = { (itemView, itemModel, index) in
    print(itemView)
    print(itemModel)
    print(index)
}
```

```
// 每个小view的宽度获取
demoView.itemWidth
// demoView的整体高度获取
demoView.totalHeight

```

