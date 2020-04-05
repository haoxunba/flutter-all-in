import 'package:flutter/material.dart';

/// Row 和 Column 都属于 flex box
class WidgetsAllInMaterialScaffold extends StatefulWidget {
  @override
  _WidgetsAllInMaterialScaffold createState() =>
      _WidgetsAllInMaterialScaffold();
}

class _WidgetsAllInMaterialScaffold
    extends State<WidgetsAllInMaterialScaffold> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded Row Sample'),
      ),
    );
  }
}
