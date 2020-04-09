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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  List<Widget> widgets = [
    StatelessContainer(),
    StatelessContainer(),
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
