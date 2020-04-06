import 'package:flutter/material.dart';
import 'routes/plugins_all_in_routes.dart';

// 如果子wighet有一个是statefulWidget那么WidgetsAllIn就必须也是StatefulWidget
class PluginsAllIn extends StatefulWidget {
  @override
  _PluginsAllIn createState() => _PluginsAllIn();
}

class _PluginsAllIn extends State<PluginsAllIn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('path_provider'),
          onPressed: () {
            Navigator.of(context)
                .push(PluginsAllInRoutes.pluginPathProviderPage());
          },
        ),
        RaisedButton(
          child: Text('rubber'),
          onPressed: () {
            Navigator.of(context).push(PluginsAllInRoutes.pluginRubberPage());
          },
        ),
      ],
    );
  }
}
