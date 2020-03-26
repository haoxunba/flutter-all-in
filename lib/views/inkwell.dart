import 'package:flutter/material.dart';

class InkWellView extends StatefulWidget {
  @override
  _InkWellViewState createState() => _InkWellViewState();
}

class _InkWellViewState extends State<InkWellView> {
  double sideLength = 50;
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
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
