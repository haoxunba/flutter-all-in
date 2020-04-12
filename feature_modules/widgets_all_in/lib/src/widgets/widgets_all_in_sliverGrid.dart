import 'package:platform_sdk/platform_sdk.dart';

import 'dart:math' as math;

/// https://medium.com/flutter/slivers-demystified-6ff68ab0296f
class WidgetsAllInSliverGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget SliverGrid'),
      ),
      body: WidgetsAllInSliverGridItem(),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class WidgetsAllInSliverGridItem extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 60.0,
        maxHeight: 200.0,
        child: Container(
            color: Colors.lightBlue, child: Center(child: Text(headerText))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        makeHeader('SliverGrid.count'),
        SliverGrid.count(
          crossAxisCount: 5,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1.0,
          children: [
            Container(color: Colors.red, height: 500.0), // 高度不起作用
            Container(color: Colors.purple, height: 150.0),
            Container(color: Colors.green, height: 150.0),
            Container(color: Colors.orange, height: 150.0),
            Container(color: Colors.yellow, height: 150.0),
            Container(color: Colors.pink, height: 150.0),
            Container(color: Colors.cyan, height: 150.0),
            Container(color: Colors.indigo, height: 150.0),
            Container(color: Colors.blue, height: 150.0),
          ],
        ),
        makeHeader('SliverGrid.extent'),
        SliverGrid.extent(
          maxCrossAxisExtent: 100,
          mainAxisSpacing: 0.0,
          crossAxisSpacing: 0.0,
          childAspectRatio: 1.0,
          children: [
            Container(color: Colors.red, height: 150.0),
            Container(color: Colors.purple, height: 150.0),
            Container(color: Colors.green, height: 150.0),
            Container(color: Colors.orange, height: 150.0),
            Container(color: Colors.yellow, height: 150.0),
            Container(color: Colors.pink, height: 150.0),
            Container(color: Colors.cyan, height: 150.0),
            Container(color: Colors.indigo, height: 150.0),
            Container(color: Colors.blue, height: 150.0),
          ],
        ),
        makeHeader('SliverGridDelegateWithMaxCrossAxisExtent'),
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                300.0, // 在保证均等划分cross axis的前提下，the child tiles 宽度的值将会尽可能接近maxCrossAxisExtent
            mainAxisSpacing: 20.0, // 网格中每行的间距
            crossAxisSpacing: 10.0, // the child tiles 在 cross axis 方向的间距
            childAspectRatio:
                1.0, // 默认值定义每个 tile 的 cross axis / main axis 的比率 ratio，1.0 表示 tile 在交叉轴和主轴的大小相等
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: new Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        makeHeader('SliverGridDelegateWithFixedCrossAxisCount'),
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0, // 网格中每行的间距
            crossAxisSpacing: 10.0, // the child tiles 在 cross axis 方向的间距
            childAspectRatio:
                1.0, // 定义每个 tile 的 cross axis / main axis 的比率 ratio，默认值 1.0 表示 tile 在交叉轴和主轴的大小相等
          ),
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: RandomColor().randomColor(),
                child: new Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        makeHeader('SliverChildListDelegate'),
        SliverGrid(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0, // 网格中每行的间距
            crossAxisSpacing: 10.0, // the child tiles 在 cross axis 方向的间距
            childAspectRatio:
                1.0, // 定义每个 tile 的 cross axis / main axis 的比率 ratio，默认值 1.0 表示 tile 在交叉轴和主轴的大小相等
          ),
          delegate: new SliverChildListDelegate([
            Container(color: Colors.red, height: 150.0),
            Container(color: Colors.purple, height: 150.0),
            Container(color: Colors.green, height: 150.0),
            Container(color: Colors.orange, height: 150.0),
            Container(color: Colors.yellow, height: 150.0),
            Container(color: Colors.pink, height: 150.0),
            Container(color: Colors.cyan, height: 150.0),
            Container(color: Colors.indigo, height: 150.0),
            Container(color: Colors.blue, height: 150.0),
          ]),
        ),
      ],
    );
  }
}
