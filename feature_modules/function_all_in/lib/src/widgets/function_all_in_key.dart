import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

/// Row 和 Column 都属于 flex box
class FunctionAllInKey extends StatefulWidget {
  @override
  _FunctionAllInKey createState() => _FunctionAllInKey();
}

class _FunctionAllInKey extends State<FunctionAllInKey> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column Widget"),
      ),
      body: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Widget> widgets = [
    /// refreence https://juejin.im/post/5ca2152f6fb9a05e1a7a9a26#heading-5
    /// https://www.youtube.com/watch?v=kn0EOS-ZiIc&feature=youtu.be
    /// 点击按钮，两个widget可以正常交换，但是换成stateful就不可以
    /// 通过 widget 的源码分析
    /// @immutable
    // abstract class Widget extends DiagnosticableTree {
    //   const Widget({ this.key });
    //   final Key key;
    //   ···
    //   static bool canUpdate(Widget oldWidget, Widget newWidget) {
    //     return oldWidget.runtimeType == newWidget.runtimeType
    //         && oldWidget.key == newWidget.key;
    //   }
    // }

    StatelessContainer(),
    StatelessContainer(),
    // StatefulContainer(key: UniqueKey(),),
    // StatefulContainer(key: UniqueKey(),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchWidget,
        child: Icon(Icons.undo),
      ),
    );
  }

  switchWidget() {
    widgets.insert(0, widgets.removeAt(1));
    setState(() {});
  }
}

class StatelessContainer extends StatelessWidget {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}

class StatefulContainer extends StatefulWidget {
  StatefulContainer({Key key}) : super(key: key);
  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  final Color color = RandomColor().randomColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
    );
  }
}
