import 'package:flutter/material.dart';

class WidgetsAllInListViewKeepScrollOffset extends StatefulWidget {
  @override
  _WidgetsAllInListViewKeepScrollOffset createState() =>
      _WidgetsAllInListViewKeepScrollOffset();
}

class _WidgetsAllInListViewKeepScrollOffset
    extends State<WidgetsAllInListViewKeepScrollOffset> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget ListView'),
      ),
      body: Container(
        height: 300,
        child: WidgetsAllInListViewItemKeepScrollOffset(),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            setState(() {});
          }),
    );
  }
}

class WidgetsAllInListViewItemKeepScrollOffset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild...........');
    return ListView(
      // 如果key是常量或没有设置，那么每次重新构建ListView都会认为是同一个，Flutter会始终保存滚动的位置，即使设置keepScrollOffset: false,也没用
      // 但是如果设置key是ObjectKey({})，keepScrollOffset的值即使是true，每次重建时也无法保存滚动位置
      // https://stackoverflow.com/questions/55718202/flutter-update-listview-and-reset-scroll-position/55720160
      // key: ObjectKey({}),
      padding: const EdgeInsets.all(8),
      controller: ScrollController(
        keepScrollOffset: false,
      ),
      children: <Widget>[
        Container(
          width: 200,
          height: 200,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 200,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 200,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}
