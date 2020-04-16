import 'package:flutter/material.dart';

import 'function_all_in_catalog.dart';
import 'widgets/function_all_in_views.dart';

const String appTitle = 'Function All In';

class FunctionAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FunnctionAllInCatalog(
      title: 'Function All In Catalog',
      catalogItems: catalogItems,
    );
  }
}

final List<FunctionAllInCatalogItem> catalogItems = [
  FunctionAllInCatalogItem(
    title: 'Key',
    targetWidget: FunnctionAllInCatalog(
      title: 'Key',
      catalogItems: [
        FunctionAllInCatalogItem(
          title: 'Normal Key',
          targetWidget: FunctionAllInKey(),
        ),
        FunctionAllInCatalogItem(
          title: 'GlobalKey',
          targetWidget: FunctionAllInGlobalKey(),
        ),
        FunctionAllInCatalogItem(
          title: 'GlobalKey Sliver',
          targetWidget: FunctionAllInGlobalKeySliver(),
        ),
      ],
    ),
  ),
];
