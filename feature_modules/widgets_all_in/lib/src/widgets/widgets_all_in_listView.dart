import 'package:flutter/material.dart';

class WidgetsAllInListView extends StatefulWidget {
  @override
  _WidgetsAllInListView createState() => _WidgetsAllInListView();
}

class _WidgetsAllInListView extends State<WidgetsAllInListView> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Widget"),
      ),
      body: Column(
        children: <Widget>[
          /// Column 中用 ListView 会报错，必须用 Expanded 包裹，或者其他方法
          /// 这种错误和 widgets_all_in_column.dart 中的错误原因差不多，可以参考
          /// Reason for the error:
          /// Column expands to the maximum size in main axis direction (vertical axis), and so does the ListView.
          /// https://stackoverflow.com/questions/45669202/how-to-add-a-listview-to-a-column-in-flutter
          Expanded(
            child: WidgetsAllInListViewCommon(),
          ),
          Expanded(
            child: WidgetsAllInListViewBuilder(),
          ),
        ],
      ),
    );
  }
}

class WidgetsAllInListViewCommon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 渲染框具有无边界约束的最常见情况是：
    /// 当其被置于 flex boxes (Row 和 Column)内以及
    /// 可滚动区域(ListView 和其它 ScrollView 的子类)内时
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        // width 不起作用，参考 widgets_all_in_container.dart
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

class WidgetsAllInListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
  }
}
