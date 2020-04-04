import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      bottomNavigationBar: Align(
        child: Container(
          child: Text('Tab'),
        ),
      ),
    );
  }
}
