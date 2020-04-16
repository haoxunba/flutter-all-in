import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

/// 该工程为了验证
/// 如果将 GlobalKey 放到 SliverList 上，通过 sliverKey.currentContext.size 获取大小会报错
/// 所以推荐将 GlobalKey 放到 SliverList 的 children 上
class FunctionAllInGlobalKeySliver extends StatefulWidget {
  @override
  _FunctionAllInGlobalKeySliver createState() =>
      _FunctionAllInGlobalKeySliver();
}

class _FunctionAllInGlobalKeySliver
    extends State<FunctionAllInGlobalKeySliver> {
  final GlobalKey sliverKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GlobalKey Sliver"),
      ),
      body: FunctionAllInGlobalKeySliverScreen(
        sliverKey: sliverKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(sliverKey.currentContext.size);
        },
      ),
    );
  }
}

class FunctionAllInGlobalKeySliverScreen extends StatelessWidget {
  final GlobalKey sliverKey;
  FunctionAllInGlobalKeySliverScreen({
    Key key,
    this.sliverKey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      // key: sliverKey,
      slivers: <Widget>[
        SliverList(
          // key: sliverKey,
          // 如果 GlobalKey 放到这里，通过 sliverKey.currentContext.size 获取大小会报错
          delegate: SliverChildListDelegate([
            Container(
              key: sliverKey, // 推荐将 GlobalKey 放到这里
              height: 100,
              color: RandomColor().randomColor(),
            ),
          ]),
        ),
      ],
    );
  }
}
