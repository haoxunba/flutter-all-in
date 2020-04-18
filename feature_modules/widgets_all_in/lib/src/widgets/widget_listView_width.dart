import 'package:flutter/material.dart';
import 'package:platform_sdk/platform_sdk.dart';

class WidgetListViewWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 渲染框具有无边界约束的最常见情况是：
    /// 当其被置于 flex boxes (Row 和 Column)内以及
    /// 可滚动区域(ListView 和其它 ScrollView 的子类)内时
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget ListView width'),
      ),
      body: Container(
        height: 200,
        child: WidgetListViewWidthItem(),
      ),
    );
  }
}

class WidgetListViewWidthItem extends StatefulWidget {
  @override
  _WidgetListViewWidthItemState createState() =>
      _WidgetListViewWidthItemState();
}

class _WidgetListViewWidthItemState extends State<WidgetListViewWidthItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      children: <Widget>[
        Container(
          // width 不起作用
          // 因为父widget没有给Container水平方向约束，所以Container会填充允许的剩余空间
          // Container的width只是对子widget的约束。
          width: 200,
          height: 50,
          color: Colors.red,
          child: Container(
            child: Text('Entry A'),
            color: RandomColor().randomColor(),
          ),
        ),
        // Align 给了 Container 宽度约束，所以这里的 width 会生效
        Align(
          child: Container(
            width: 200,
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}
