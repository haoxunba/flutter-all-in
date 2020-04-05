import 'package:flutter/material.dart';
import '../widgets/widgets_all_in_views.dart';

class WidgetsAllInRoutes {
  static PageRoute inkwellPage() => MaterialPageRoute(
        builder: (context) => InkWellView(),
      );
  static PageRoute widgetsAllInListViewPage() => MaterialPageRoute(
        builder: (context) => WidgetsAllInListView(),
      );
  static PageRoute stackPage() => MaterialPageRoute(
        builder: (context) => StackView(),
      );
  static PageRoute widgetsAllInContainerPage() => MaterialPageRoute(
        builder: (context) => WidgetsAllInContainer(),
      );
  static PageRoute imagePage() => MaterialPageRoute(
        builder: (context) => ImageView(),
      );
  static PageRoute statefullWidgetPage() => MaterialPageRoute(
        builder: (context) => StatefullWidgetView(),
      );
  static PageRoute statelessWidgetPage() => MaterialPageRoute(
        builder: (context) => StatelessWidgetView(),
      );
  static PageRoute textPage() => MaterialPageRoute(
        builder: (context) => TextView(),
      );
}
