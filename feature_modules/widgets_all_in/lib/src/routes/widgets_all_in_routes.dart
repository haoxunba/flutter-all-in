import 'package:flutter/material.dart';
import '../widgets/views.dart';

class WidgetsAllInRoutes {
  static PageRoute inkwellPage() => MaterialPageRoute(
        builder: (context) => InkWellView(),
      );
  static PageRoute stackPage() => MaterialPageRoute(
        builder: (context) => StackView(),
      );
}
