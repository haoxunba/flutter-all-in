import 'package:flutter/material.dart';
import './routes/widgets_all_in_routes.dart';

// 如果子wighet有一个是statefulWidget那么WidgetsAllIn就必须也是StatefulWidget
class WidgetsAllIn extends StatefulWidget {
  @override
  _WidgetsAllIn createState() => _WidgetsAllIn();
}

class _WidgetsAllIn extends State<WidgetsAllIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets All In'),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text('Container'),
          onPressed: () {
            Navigator.of(context).push(WidgetsAllInRoutes.containerPage());
          },
        ),
        RaisedButton(
          child: Text('Image'),
          onPressed: () {
            Navigator.of(context).push(WidgetsAllInRoutes.imagePage());
          },
        ),
        RaisedButton(
          child: Text('InkWell'),
          onPressed: () {
            Navigator.of(context).push(WidgetsAllInRoutes.inkwellPage());
          },
        ),
        RaisedButton(
          child: Text('Stack'),
          onPressed: () {
            Navigator.of(context).push(WidgetsAllInRoutes.stackPage());
          },
        ),
      ]),
    );
  }
}
