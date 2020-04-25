import 'package:flutter/material.dart';

class WidgetNavigatorOf extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      home: _WidgetNavigatorBasicFirstRoute(),
    );
  }
}

class _WidgetNavigatorBasicFirstRoute extends StatelessWidget {
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
            Navigator.of(context).push(
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
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => _WidgetNavigatorBasicThirdRoute()),
            );
          },
          child: Text('Route Next!'),
        ),
      ),
    );
  }
}

class _WidgetNavigatorBasicThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // rootNavigator: true 此时返回的不是上一级页面
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
