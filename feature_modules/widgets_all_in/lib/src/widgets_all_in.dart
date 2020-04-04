import 'package:flutter/material.dart';
import './routes/widgets_all_in_routes.dart';

class WidgetsAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets All In'),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('InkWell'),
          onPressed: () {
            Navigator.of(context).push(WidgetsAllInRoutes.inkwellPage());
          },
        ),
        RaisedButton(
          child: Text('stack'),
          onPressed: () {
            Navigator.of(context).push(WidgetsAllInRoutes.stackPage());
          },
        ),
      ]),
    );
  }
}
