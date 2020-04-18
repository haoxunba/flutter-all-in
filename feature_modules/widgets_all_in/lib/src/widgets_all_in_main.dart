import 'package:platform_sdk/platform_sdk.dart';

import 'widgets/widgets_all_in_views.dart';

const String appTitle = 'Widgets All In';

class WidgetsAllIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformSdkCatalog(
      title: 'PlatformSdkCatalog',
      catalogItems: catalogItems,
    );
  }
}

final List<PlatformSdkCatalogItem> catalogItems = [
  PlatformSdkCatalogItem(
    title: 'Material',
    targetWidget: PlatformSdkCatalog(
      title: 'Material',
      catalogItems: [
        PlatformSdkCatalogItem(
          title: 'SliverAppBar',
          targetWidget: WidgetsAllInSliverAppBar(),
        ),
        PlatformSdkCatalogItem(
          title: 'Scaffold',
          targetWidget: WidgetsAllInMaterialScaffold(),
        ),
      ],
    ),
  ),
  PlatformSdkCatalogItem(
    title: 'Column',
    targetWidget: WidgetsAllInColumn(),
  ),
  PlatformSdkCatalogItem(
    title: 'Expanded',
    targetWidget: WidgetsAllInExpanded(),
  ),
  PlatformSdkCatalogItem(
    title: 'Form',
    targetWidget: WidgetsAllInForm(),
  ),
  PlatformSdkCatalogItem(
    title: 'Gesture',
    targetWidget: WidgetsAllInGestureDetector(),
  ),
  PlatformSdkCatalogItem(
    title: 'Image',
    targetWidget: WidgetsAllInImage(),
  ),
  PlatformSdkCatalogItem(
    title: 'InkWell',
    targetWidget: WidgetsAllInInkWell(),
  ),
  PlatformSdkCatalogItem(
    title: 'ListView',
    targetWidget: PlatformSdkCatalog(
      title: 'ListView',
      catalogItems: [
        PlatformSdkCatalogItem(
          title: 'Normal ListView',
          targetWidget: WidgetsAllInListView(),
        ),
        PlatformSdkCatalogItem(
          title: 'ListView.builder',
          targetWidget: WidgetsAllInListViewBuilder(),
        ),
        PlatformSdkCatalogItem(
          title: 'ListView KeepScrollOffset',
          targetWidget: WidgetsAllInListViewKeepScrollOffset(),
        ),
        PlatformSdkCatalogItem(
          title: 'ListView ScrollController',
          targetWidget: WidgetsAllInListViewScrollController(),
        ),
        PlatformSdkCatalogItem(
          title: 'ListView NotificationListener',
          targetWidget: WidgetListViewNotificationListenerPage(),
        ),
        PlatformSdkCatalogItem(
          title: 'ListView Width',
          targetWidget: WidgetListViewWidth(),
        ),
        PlatformSdkCatalogItem(
          title: 'ListView Column',
          targetWidget: WidgetListViewColumn(),
        ),
      ],
    ),
  ),
  PlatformSdkCatalogItem(
    title: 'SingleChildScroll',
    targetWidget: WidgetsAllInSingleChildScrollView(),
  ),
  PlatformSdkCatalogItem(
    title: 'SliverGrid',
    targetWidget: WidgetsAllInSliverGrid(),
  ),
  PlatformSdkCatalogItem(
    title: 'SliverList',
    targetWidget: WidgetSliverList(),
  ),
  PlatformSdkCatalogItem(
    title: 'Stack',
    targetWidget: WidgetsAllInStack(),
  ),
  PlatformSdkCatalogItem(
    title: 'StatefullWidget',
    targetWidget: WidgetsAllInStatefullWidget(),
  ),
  PlatformSdkCatalogItem(
    title: 'StatelessWidget',
    targetWidget: WidgetsAllInStatelessWidget(),
  ),
  PlatformSdkCatalogItem(
    title: 'Text',
    targetWidget: WidgetsAllInText(),
  ),
];
