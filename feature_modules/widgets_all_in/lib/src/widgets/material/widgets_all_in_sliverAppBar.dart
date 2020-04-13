import 'package:platform_sdk/platform_sdk.dart';

import 'dart:math' as math;

/// https://medium.com/flutter/slivers-demystified-6ff68ab0296f
class WidgetsAllInSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WidgetsAllInSliverAppBarItem(),
    );
  }
}

class WidgetsAllInSliverAppBarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // 与 Scaffold.appBar 不共存
        SliverAppBar(
          expandedHeight: 150.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('Available seats'),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle),
              tooltip: 'Add new entry',
              onPressed: () {/* ... */},
            ),
          ],
        ),
        SliverGrid.count(
          crossAxisCount: 3,
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
      ],
    );
  }
}
