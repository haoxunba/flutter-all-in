import 'package:flutter/material.dart';

class StatefullWidgetView extends StatefulWidget {
  @override
  _StatefullWidgetView createState() => _StatefullWidgetView();
}

class _StatefullWidgetView extends State<StatefullWidgetView> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Widget"),
      ),
      body:

          /// 测试statefull widget 里面渲染 stateless widget
          /// 有时会报错 Type ... is not a subtype of type 'Stateless Widget'
          /// 很有可能是热更新导致的 https://github.com/flutter/flutter/issues/25360
          StatefullWidgetTestStatelessWidgetView(),
    );
  }
}

class StatefullWidgetTestStatelessWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('StatefullWidgetView');
  }
}
