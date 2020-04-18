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
    title: 'Material',
    targetWidget: WidgetsAllInCatalog(
      title: 'Material',
      catalogItems: [
        WidgetsAllInCatalogItem(
          title: 'SliverAppBar',
          targetWidget: WidgetsAllInSliverAppBar(),
        ),
        WidgetsAllInCatalogItem(
          title: 'Scaffold',
          targetWidget: WidgetsAllInMaterialScaffold(),
        ),
      ],
    ),
  ),
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
    title: 'Gesture',
    targetWidget: WidgetsAllInGestureDetector(),
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
    title: 'ListView',
    targetWidget: WidgetsAllInCatalog(
      title: 'ListView',
      catalogItems: [
        WidgetsAllInCatalogItem(
          title: 'Normal ListView',
          targetWidget: WidgetsAllInListView(),
        ),
        WidgetsAllInCatalogItem(
          title: 'ListView.builder',
          targetWidget: WidgetsAllInListViewBuilder(),
        ),
        WidgetsAllInCatalogItem(
          title: 'ListView KeepScrollOffset',
          targetWidget: WidgetsAllInListViewKeepScrollOffset(),
        ),
        WidgetsAllInCatalogItem(
          title: 'ListView ScrollController',
          targetWidget: WidgetsAllInListViewScrollController(),
        ),
        WidgetsAllInCatalogItem(
          title: 'ListView NotificationListener',
          targetWidget: WidgetListViewNotificationListenerPage(),
        ),
        WidgetsAllInCatalogItem(
          title: 'ListView Width',
          targetWidget: WidgetListViewWidth(),
        ),
        WidgetsAllInCatalogItem(
          title: 'ListView Column',
          targetWidget: WidgetListViewColumn(),
        ),
      ],
    ),
  ),
  WidgetsAllInCatalogItem(
    title: 'SingleChildScroll',
    targetWidget: WidgetsAllInSingleChildScrollView(),
  ),
  WidgetsAllInCatalogItem(
    title: 'SliverGrid',
    targetWidget: WidgetsAllInSliverGrid(),
  ),
  WidgetsAllInCatalogItem(
    title: 'SliverList',
    targetWidget: WidgetSliverList(),
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
