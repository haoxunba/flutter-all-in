import 'package:flutter/material.dart';

class WidgetMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MaterialApp'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
