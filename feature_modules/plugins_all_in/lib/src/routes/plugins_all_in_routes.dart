import 'package:flutter/material.dart';
import '../plugin_path_provider/plugin_path_provider.dart';
import '../plugin_rubber/plugin_rubber.dart';

class PluginsAllInRoutes {
  static PageRoute pluginPathProviderPage() => MaterialPageRoute(
        builder: (context) => PluginPathProvider(
          storage: CounterStorage(),
        ),
      );
  static PageRoute pluginRubberPage() => MaterialPageRoute(
        builder: (context) => PluginRubber(
          title: 'Plugin Rubber',
        ),
      );
}
