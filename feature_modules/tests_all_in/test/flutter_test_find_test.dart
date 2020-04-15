// 通过 flutter_test 提供的 Finder 类，来查找 Widget

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// 将 Widget 写在这里方便练习 test
void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget(title: 'T', message: 'M'));
    // final titleFinder = find.text('T');
    // final messageFinder = find.text('M');
    // expect(titleFinder, findsOneWidget);
    // expect(messageFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  final String title;
  final String message;

  const MyWidget({
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
