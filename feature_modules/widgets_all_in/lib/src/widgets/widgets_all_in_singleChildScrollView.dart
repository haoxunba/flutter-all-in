// Flutter code sample for SingleChildScrollView

// In this example, the children are spaced out equally, unless there's no more
// room, in which case they stack vertically and scroll.
//
// When using this technique, [Expanded] and [Flexible] are not useful, because
// in both cases the "available space" is infinite (since this is in a viewport).
// The next section describes a technique for providing a maximum height constraint.

import 'package:flutter/material.dart';

class WidgetsAllInSingleChildScrollView extends StatelessWidget {
  WidgetsAllInSingleChildScrollView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Widget"),
      ),
      body: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          // ConstrainedBox
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Container(
                    // A fixed-height child.
                    color: const Color(0xff808000), // Yellow
                    height: 120.0,
                  ),
                  Expanded(
                    // A flexible child that will grow to fit the viewport but
                    // still be at least as big as necessary to fit its contents.
                    child: Container(
                      color: const Color(0xff800000), // Red
                      height: 120.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
