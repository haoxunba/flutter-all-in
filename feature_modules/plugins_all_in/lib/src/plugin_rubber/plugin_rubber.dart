import 'package:flutter/material.dart';

import './plugin_rubber_dismissable.dart';
import './plugin_rubber_scroll.dart';
import './plugin_rubber_spring.dart';
import './plugin_rubber_default.dart';
import './plugin_rubber_menu.dart';

// https://github.com/mcrovero/rubber
class PluginRubber extends StatefulWidget {
  PluginRubber({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PluginRubber createState() => _PluginRubber();
}

class _PluginRubber extends State<PluginRubber>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.cyan[900]),
        ),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("Default"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DefaultPage()),
              );
            },
          ),
          RaisedButton(
            child: Text("Menu"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
          RaisedButton(
            child: Text("Spring settings"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SpringPage()),
              );
            },
          ),
          RaisedButton(
            child: Text("Scrolling"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScrollPage()),
              );
            },
          ),
          RaisedButton(
            child: Text("Dismissable"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DismissablePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
