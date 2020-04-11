import 'package:flutter/material.dart';

import 'widgets_all_in_catalog.dart';
import 'widgets/widgets_all_in_views.dart';

const String appTitle = 'Widgets All In';

class WidgetsAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsAllInCatalog(
      title: 'WidgetsAllInCatalog',
      catalogItems: catalogItems,
    );
  }
}

final List<WidgetsAllInCatalogItem> catalogItems = [
  WidgetsAllInCatalogItem(
    title: 'Column',
    targetWidget: WidgetsAllInColumn(),
  ),
  WidgetsAllInCatalogItem(
    title: 'Expanded',
    targetWidget: WidgetsAllInExpanded(),
  ),
  WidgetsAllInCatalogItem(
    title: 'Form',
    targetWidget: WidgetsAllInForm(),
  ),
  WidgetsAllInCatalogItem(
    title: 'Image',
    targetWidget: WidgetsAllInImage(),
  ),
  WidgetsAllInCatalogItem(
    title: 'InkWell',
    targetWidget: WidgetsAllInInkWell(),
  ),
  WidgetsAllInCatalogItem(
    title: 'List',
    targetWidget: WidgetsAllInCatalog(
      title: 'List',
      catalogItems: [
        WidgetsAllInCatalogItem(
          title: 'Normal List',
          targetWidget: WidgetsAllInListView(),
        ),
      ],
    ),
  ),
  WidgetsAllInCatalogItem(
    title: 'SingleChildScroll',
    targetWidget: WidgetsAllInSingleChildScrollView(),
  ),
  WidgetsAllInCatalogItem(
    title: 'Stack',
    targetWidget: WidgetsAllInStack(),
  ),
  WidgetsAllInCatalogItem(
    title: 'StatefullWidget',
    targetWidget: WidgetsAllInStatefullWidget(),
  ),
  WidgetsAllInCatalogItem(
    title: 'StatelessWidget',
    targetWidget: WidgetsAllInStatelessWidget(),
  ),
  WidgetsAllInCatalogItem(
    title: 'Text',
    targetWidget: WidgetsAllInText(),
  ),
];
