import 'package:platform_sdk/platform_sdk.dart';

import 'plugin_rubber/plugin_rubber.dart';
import 'plugin_lumberdash/plugin_lumberdash.dart';
import 'plugin_path_provider/plugin_path_provider.dart';
import 'plugin_hydrated_bloc/plugin_hydrated_bloc.dart';

const String appTitle = 'Function All In';

class PluginsAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformSdkCatalog(
      title: 'Plugins All In Catalog',
      catalogItems: catalogItems,
    );
  }
}

final List<PlatformSdkCatalogItem> catalogItems = [
  PlatformSdkCatalogItem(
    title: 'path_provider',
    targetWidget: PluginPathProvider(
      storage: CounterStorage(),
    ),
  ),
  PlatformSdkCatalogItem(
    title: 'rubber',
    targetWidget: PlatformSdkCatalog(
      title: 'Rubber',
      catalogItems: [
        PlatformSdkCatalogItem(
          title: 'Rubber Dedault',
          targetWidget: PluginRubberDefaultPage(),
        ),
        PlatformSdkCatalogItem(
          title: 'Rubber Dismissable',
          targetWidget: PluginRubberDismissablePage(),
        ),
        PlatformSdkCatalogItem(
          title: 'Rubber Menu',
          targetWidget: PluginRubberMenuPage(),
        ),
        PlatformSdkCatalogItem(
          title: 'Rubber Scroll',
          targetWidget: PluginRubberScrollPage(),
        ),
        PlatformSdkCatalogItem(
          title: 'Rubber Spring',
          targetWidget: PluginRubberSpringPage(),
        ),
      ],
    ),
  ),
  PlatformSdkCatalogItem(
    title: 'hydrated_bloc',
    targetWidget: PluginHydratedBloc(),
  ),
  PlatformSdkCatalogItem(
    title: 'lumberdash',
    targetWidget: PluginLumberdash(),
  ),
];
