import 'package:flutter/material.dart';
import '../views/views.dart';

class AppRoutes {
  static PageRoute stackPage() => MaterialPageRoute(
        builder: (context) => StackView(),
      );
}
