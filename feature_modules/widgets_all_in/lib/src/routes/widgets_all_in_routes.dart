import 'package:flutter/material.dart';
import '../widgets/views.dart';

class WidgetsAllInRoutes {
  static PageRoute inkwellPage() => MaterialPageRoute(
        builder: (context) => InkWellView(),
      );
  static PageRoute stackPage() => MaterialPageRoute(
        builder: (context) => StackView(),
      );
  static PageRoute containerPage() => MaterialPageRoute(
        builder: (context) => ContainerView(),
      );
  static PageRoute imagePage() => MaterialPageRoute(
        builder: (context) => ImageView(),
      );
}
