import 'package:flutter/material.dart';

import 'plugin_rubber/plugin_rubber.dart';
import 'plugins_all_in_catalog.dart';
import 'plugin_lumberdash/plugin_lumberdash.dart';
import 'plugin_path_provider/plugin_path_provider.dart';
import 'plugin_hydrated_bloc/plugin_hydrated_bloc.dart';

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
    targetWidget: PluginsAllInCatalog(
      title: 'Rubber',
      catalogItems: [
        PluginsAllInCatalogItem(
          title: 'Rubber Dedault',
          targetWidget: PluginRubberDefaultPage(),
        ),
        PluginsAllInCatalogItem(
          title: 'Rubber Dismissable',
          targetWidget: PluginRubberDismissablePage(),
        ),
        PluginsAllInCatalogItem(
          title: 'Rubber Menu',
          targetWidget: PluginRubberMenuPage(),
        ),
        PluginsAllInCatalogItem(
          title: 'Rubber Scroll',
          targetWidget: PluginRubberScrollPage(),
        ),
        PluginsAllInCatalogItem(
          title: 'Rubber Spring',
          targetWidget: PluginRubberSpringPage(),
        ),
      ],
    ),
  ),
  PluginsAllInCatalogItem(
    title: 'hydrated_bloc',
    targetWidget: PluginHydratedBloc(),
  ),
  PluginsAllInCatalogItem(
    title: 'lumberdash',
    targetWidget: PluginLumberdash(),
  ),
];
