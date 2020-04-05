import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final double price = 500.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widget"),
      ),
      body: ListView(
        children: <Widget>[
          Text(price.toString()), // 渲染double类型需要转换成string类型
        ],
      ),
    );
  }
}
