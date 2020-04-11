import 'package:flutter/material.dart';

class WidgetsAllInInkWell extends StatefulWidget {
  @override
  _WidgetsAllInInkWell createState() => _WidgetsAllInInkWell();
}

class _WidgetsAllInInkWell extends State<WidgetsAllInInkWell> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inkwell Widget"),
      ),
      body: Center(
        child: Material(
          color: Colors.black,
          child: InkWell(
            onTap: () {
              setState(() {
                sideLength == 50 ? sideLength = 1 : sideLength = 50;
              });
            },
          ),
        ),
      ),
    );
  }
}
