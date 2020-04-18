import 'package:platform_sdk/platform_sdk.dart';

import 'bloc_basic/bloc_basic.dart';
import 'bloc_listner/bloc_listner.dart';
import 'bloc_multi_listner/bloc_multi_listner.dart';

const String appTitle = 'Blocs All In';

class BlocsAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformSdkCatalog(
      title: 'Blocs All In Catalog',
      catalogItems: catalogItems,
    );
  }
}

final List<PlatformSdkCatalogItem> catalogItems = [
  PlatformSdkCatalogItem(
    title: 'Bloc',
    targetWidget: PlatformSdkCatalog(
      title: 'Bloc',
      catalogItems: [
        PlatformSdkCatalogItem(
          title: 'Bloc basic',
          targetWidget: BlocBasic(),
        ),
        PlatformSdkCatalogItem(
          title: 'Bloc BlocListner',
          targetWidget: BlocBlocListner(),
        ),
        PlatformSdkCatalogItem(
          title: 'Bloc MultiBlocListner',
          targetWidget: BlocMultiBlocListner(),
        ),
      ],
    ),
  ),
];
