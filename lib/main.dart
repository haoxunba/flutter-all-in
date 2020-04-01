import 'package:flutter/material.dart';
import './views/views.dart';

void main() => runApp(MyApp());

final routes = {
  '/': (context) => MyHomePage(),
  '/inkWellView': (context) => InkWellView(),
  '/stackView': (context) => StackView(),
};

class MyApp extends StatelessWidget {
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
