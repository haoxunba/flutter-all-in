import 'package:flutter/material.dart';

class WidgetListViewColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget ListView Column'),
      ),
      body: Container(
        height: 200,
        child: WidgetListViewColumnPageItem(),
      ),
    );
  }
}

class WidgetListViewColumnPageItem extends StatefulWidget {
  @override
  _WidgetsAllInListViewItem createState() => _WidgetsAllInListViewItem();
}

class _WidgetsAllInListViewItem extends State<WidgetListViewColumnPageItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Column A')),
            ),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Column B')),
            ),
            Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Column C')),
            ),
          ],
        ),
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}
