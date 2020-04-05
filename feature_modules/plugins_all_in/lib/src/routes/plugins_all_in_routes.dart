import 'package:flutter/material.dart';
import '../plugin_path_provider/plugin_path_provider.dart';

class PluginsAllInRoutes {
  static PageRoute pluginPathProvider() => MaterialPageRoute(
        builder: (context) => PluginPathProvider(
          storage: CounterStorage(),
        ),
      );
}
