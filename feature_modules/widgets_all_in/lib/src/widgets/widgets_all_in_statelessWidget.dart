import 'package:flutter/material.dart';

class StatelessWidgetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statefull Widget"),
      ),
      body:
          StatelessWidgetTestStatefullWidgetView(), // 测试stateless widget 里面渲染 statefull widget
    );
  }
}

class StatelessWidgetTestStatefullWidgetView extends StatefulWidget {
  @override
  _StatelessWidgetTestStatefullWidgetView createState() =>
      _StatelessWidgetTestStatefullWidgetView();
}

class _StatelessWidgetTestStatefullWidgetView
    extends State<StatelessWidgetTestStatefullWidgetView> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Text('StatelessWidgetTestStatefullWidgetView');
  }
}
