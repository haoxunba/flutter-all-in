import 'package:flutter/material.dart';

// 实现涟漪效果
class WidgetsAllInInkWell extends StatefulWidget {
  @override
  _WidgetsAllInInkWell createState() => _WidgetsAllInInkWell();
}

class _WidgetsAllInInkWell extends State<WidgetsAllInInkWell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inkwell Widget"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Inkwell Button'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Text('Normal Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
