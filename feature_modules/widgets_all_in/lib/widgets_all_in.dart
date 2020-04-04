library widgets_all_in;

import 'package:flutter/material.dart';
import './src/views/views.dart';

final routes = {
  '/': (context) => MyHomePage(),
  '/inkWellView': (context) => InkWellView(),
  '/stackView': (context) => StackView(),
};

class WidgetsAllIn extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: routes,
    );
  }
}