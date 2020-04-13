import 'package:flutter/material.dart';

class WidgetsAllInListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget ListView'),
      ),
      body: Container(
        height: 200,
        child: WidgetsAllInListViewItem(),
      ),
    );
  }
}

class WidgetsAllInListViewItem extends StatefulWidget {
  @override
  _WidgetsAllInListViewItem createState() => _WidgetsAllInListViewItem();
}

class _WidgetsAllInListViewItem extends State<WidgetsAllInListViewItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      // 强制child在滚动方向的固定大小值（默认垂直滚动，那么就表示强制child的高度是100）
      // 在快速滚动时，滚动机制可以节省工作负荷
      // itemExtent会覆盖child已经设置的高度，child设置的高度就无效了
      itemExtent: 100,
      // 初始化时，让list先滚动100
      controller: ScrollController(
        initialScrollOffset: 100,
        keepScrollOffset: false,
      ),
      children: <Widget>[
        // width 不起作用，参考widgets_all_in_container.dart
        Container(
          width: 200,
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
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
