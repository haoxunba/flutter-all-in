import 'package:flutter/material.dart';

class WidgetsAllInListViewScrollController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget ListView'),
      ),
      body: WidgetsAllInListViewScrollControllerItem(),
    );
  }
}

class WidgetsAllInListViewScrollControllerItem extends StatefulWidget {
  @override
  _WidgetsAllInListViewScrollControllerItem createState() =>
      _WidgetsAllInListViewScrollControllerItem();
}

class _WidgetsAllInListViewScrollControllerItem
    extends State<WidgetsAllInListViewScrollControllerItem> {
  /// https://book.flutterchina.club/chapter6/scroll_controller.html
  /// ```
  /// ScrollPosition createScrollPosition(
  ///   ScrollPhysics physics,
  ///   ScrollContext context,
  ///   ScrollPosition oldPosition);
  /// void attach(ScrollPosition position) ;
  /// void detach(ScrollPosition position) ;
  /// ```
  /// 当ScrollController和可滚动组件关联时，可滚动组件首先会调用ScrollController的createScrollPosition()方法来创建一个ScrollPosition来存储滚动位置信息，
  /// 接着，可滚动组件会调用attach()方法，将创建的ScrollPosition添加到ScrollController的positions属性中，
  /// 这一步称为“注册位置”，只有注册后animateTo() 和 jumpTo()才可以被调用。

  /// 当可滚动组件销毁时，会调用ScrollController的detach()方法，
  /// 将其ScrollPosition对象从ScrollController的positions属性中移除，这一步称为“注销位置”，注销后animateTo() 和 jumpTo() 将不能再被调用。

  /// 需要注意的是，ScrollController的animateTo() 和 jumpTo()内部会调用所有ScrollPosition的animateTo() 和 jumpTo()，
  /// 以实现所有和该ScrollController关联的可滚动组件都滚动到指定的位置。
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      // offset 只是便捷属性，真正所有的位置信息在position属性中
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        key: PageStorageKey(1),
        itemCount: 100,
        itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
        controller: _controller,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}
