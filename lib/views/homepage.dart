import 'package:flutter/material.dart';
import '../navigators/routes.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('InkWell'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.pushNamed(
              context,
              '/inkWellView',
            );
          },
        ),
        RaisedButton(
          child: Text('stack'),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.of(context).push(AppRoutes.stackPage());
          },
        ),
      ]),
    );
  }
}
