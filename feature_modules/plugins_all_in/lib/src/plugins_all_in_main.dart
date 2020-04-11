import 'package:flutter/material.dart';

import 'plugins_all_in_catalog.dart';
import 'plugin_path_provider/plugin_path_provider.dart';
import 'plugin_rubber/plugin_rubber.dart';

const String appTitle = 'Function All In';

class PluginsAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PluginsAllInCatalog(
      title: 'Plugins All In Catalog',
      catalogItems: catalogItems,
    );
  }
}

final List<PluginsAllInCatalogItem> catalogItems = [
  PluginsAllInCatalogItem(
    title: 'path_provider',
    targetWidget: PluginPathProvider(
      storage: CounterStorage(),
    ),
  ),
  PluginsAllInCatalogItem(
    title: 'rubber',
    targetWidget: PluginRubber(),
  ),
];
