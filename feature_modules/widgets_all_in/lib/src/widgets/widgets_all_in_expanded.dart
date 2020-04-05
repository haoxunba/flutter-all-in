import 'package:flutter/material.dart';

/// Row 和 Column 都属于 flex box
class WidgetsAllInExpanded extends StatefulWidget {
  @override
  _WidgetsAllInExpanded createState() => _WidgetsAllInExpanded();
}

class _WidgetsAllInExpanded extends State<WidgetsAllInExpanded> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded Row Sample'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.amber,
                height: 100,
              ),
            ),
            Container(
              color: Colors.blue,
              height: 100,
              width: 50,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.amber,
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
