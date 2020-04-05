import 'package:flutter/material.dart';

class WidgetsAllInListView extends StatefulWidget {
  @override
  _WidgetsAllInListView createState() => _WidgetsAllInListView();
}

class _WidgetsAllInListView extends State<WidgetsAllInListView> {
  double sideLength = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Widget"),
      ),
      body: Column(
        children: <Widget>[
          /// Column 中用 ListView 会报错，必须用 Expanded 包裹，或者其他方法
          /// Reason for the error:
          /// Column expands to the maximum size in main axis direction (vertical axis), and so does the ListView.
          /// https://stackoverflow.com/questions/45669202/how-to-add-a-listview-to-a-column-in-flutter
          Expanded(
            child: WidgetsAllInListViewCommon(),
          ),
        ],
      ),
    );
  }
}

class WidgetsAllInListViewCommon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          width: 20,
          height: 20,
          color: Colors.blue,
        ),
        Container(
          width: 20,
          height: 20,
          color: Colors.yellow,
        ),
        Container(
          width: 20,
          height: 20,
          color: Colors.pink,
        ),
      ],
    );
  }
}
