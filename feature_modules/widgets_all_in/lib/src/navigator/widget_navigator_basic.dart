import 'package:flutter/material.dart';

// 基础导航 https://flutter.cn/docs/cookbook/navigation/navigation-basics

class WidgetNavigatorBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => _WidgetNavigatorBasicSecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class _WidgetNavigatorBasicSecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
