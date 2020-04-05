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
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('Container'),
          onPressed: () {
            Navigator.of(context)
                .push(WidgetsAllInRoutes.widgetsAllInContainerPage());
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
          child: Text('ListView'),
          onPressed: () {
            Navigator.of(context)
                .push(WidgetsAllInRoutes.widgetsAllInListViewPage());
          },
        ),
        RaisedButton(
          child: Text('Stack'),
          onPressed: () {
            Navigator.of(context).push(WidgetsAllInRoutes.stackPage());
          },
        ),
        RaisedButton(
          child: Text('StatefullWidget'),
          onPressed: () {
            Navigator.of(context)
                .push(WidgetsAllInRoutes.statefullWidgetPage());
          },
        ),
        RaisedButton(
          child: Text('StatelessWidget'),
          onPressed: () {
            Navigator.of(context)
                .push(WidgetsAllInRoutes.statelessWidgetPage());
          },
        ),
        RaisedButton(
          child: Text('Text'),
          onPressed: () {
            Navigator.of(context).push(WidgetsAllInRoutes.textPage());
          },
        ),
      ],
    );
  }
}
