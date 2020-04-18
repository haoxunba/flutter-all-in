import 'package:platform_sdk/platform_sdk.dart';

import 'widgets/function_all_in_views.dart';

const String appTitle = 'Function All In';

class FunctionAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformSdkCatalog(
      title: 'Function All In Catalog',
      catalogItems: catalogItems,
    );
  }
}

final List<PlatformSdkCatalogItem> catalogItems = [
  PlatformSdkCatalogItem(
    title: 'Key',
    targetWidget: PlatformSdkCatalog(
      title: 'Key',
      catalogItems: [
        PlatformSdkCatalogItem(
          title: 'Normal Key',
          targetWidget: FunctionAllInKey(),
        ),
        PlatformSdkCatalogItem(
          title: 'GlobalKey',
          targetWidget: FunctionAllInGlobalKey(),
        ),
        PlatformSdkCatalogItem(
          title: 'GlobalKey Sliver',
          targetWidget: FunctionAllInGlobalKeySliver(),
        ),
      ],
    ),
  ),
];
