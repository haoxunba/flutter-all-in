import 'package:platform_sdk/platform_sdk.dart';
import 'dart_extends.dart';

const String appTitle = 'Dart All In';

class DartAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformSdkCatalog(
      title: 'Dart All In Catalog',
      catalogItems: catalogItems,
    );
  }
}

final List<PlatformSdkCatalogItem> catalogItems = [
  PlatformSdkCatalogItem(
    title: 'extends',
    targetWidget: DartExtendsPage(),
  ),
];
