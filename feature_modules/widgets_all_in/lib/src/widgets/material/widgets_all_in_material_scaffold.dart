import 'package:flutter/material.dart';

class WidgetsAllInMaterialScaffold extends StatefulWidget {
  @override
  _WidgetsAllInMaterialScaffold createState() =>
      _WidgetsAllInMaterialScaffold();
}

class _WidgetsAllInMaterialScaffold
    extends State<WidgetsAllInMaterialScaffold> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample Code'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text('You have pressed the button $_count times.'),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _count++;
        }),
        tooltip: 'Increment Counter',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
