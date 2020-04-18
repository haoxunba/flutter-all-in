import 'package:platform_sdk/platform_sdk.dart';

import 'bloc_basic/bloc_basic.dart';

const String appTitle = 'Blocs All In';

class BlocsAllIn extends StatelessWidget {
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
    title: 'Bloc basic',
    targetWidget: BlocBasic(),
  ),
];
