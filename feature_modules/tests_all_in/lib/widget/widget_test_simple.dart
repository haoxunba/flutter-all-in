import 'package:flutter/material.dart';

// widget 必须在test文件中导入，才会被执行测试检查，否则不会测试这段内容
class WidgetTestSimple extends StatelessWidget {
  final String title;
  final String message;

  const WidgetTestSimple({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
